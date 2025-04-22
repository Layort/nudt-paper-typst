import cv2

# 全局变量存储坐标和临时图像
drawing = False
ix, iy = -1, -1
fx, fy = -1, -1

id_ = 4

def mouse_callback(event, x, y, flags, param):
    global ix, iy, fx, fy, drawing, img,img2,id_
    
    if event == cv2.EVENT_LBUTTONDOWN:
        drawing = True
        ix, iy = x, y
        img = img_copy.copy()  # 每次重新开始绘制时恢复原图
        
    elif event == cv2.EVENT_MOUSEMOVE:
        if drawing:
            img = img_copy.copy()
            cv2.rectangle(img, (ix, iy), (x, y), (0, 255, 0), 2)  # 实时显示绿色框
            cv2.imshow('Image', img)
            
    elif event == cv2.EVENT_LBUTTONUP:
        drawing = False
        fx, fy = x, y
        cv2.rectangle(img, (ix, iy), (fx, fy), (0, 0, 255), 2)  # 最终红色框
        cv2.imshow('Image', img)
        
        # 计算裁剪区域
        x_min = min(ix, fx)
        y_min = min(iy, fy)
        width = abs(fx - ix)
        height = abs(fy - iy)
        
        # 执行裁剪
        if width > 0 and height > 0:
            cropped = img_copy[y_min:y_min+height, x_min:x_min+width]
            cv2.imshow('Cropped', cropped)
            cv2.imwrite('cropped_gt_%d.png'%id_, cropped)
            cv2.imwrite('cropped_pred_%d.png'%id_, img2[y_min:y_min+height, x_min:x_min+width])
            cv2.imwrite('cropped_pred_2_%d.png'%id_, img3[y_min:y_min+height, x_min:x_min+width])
            id_ += 1
            print("裁剪完成，结果已保存为 cropped_result.png")

# 主程序
if __name__ == "__main__":
    img = cv2.imread(r"C:\Users\Lenovo\Desktop\vis\LEFT_gt.png")  # ← 修改为你的图片路径
    img2 = cv2.imread(r"C:\Users\Lenovo\Desktop\vis\LEFT_pred.png")
    img3 = cv2.imread(r"C:\Users\Lenovo\Desktop\vis\LEFT_pred_2.png")
    img_copy = img.copy()
    
    cv2.namedWindow('Image')
    cv2.setMouseCallback('Image', mouse_callback)
    
    while True:
        cv2.imshow('Image', img)
        key = cv2.waitKey(1) & 0xFF
        if key == 27:  # 按ESC退出
            break
    
    cv2.destroyAllWindows()