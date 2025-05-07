#import "@preview/cuti:0.2.1": show-cn-fakebold
#show: show-cn-fakebold
#let tnr = "Times New Roman"
#let fsong = (tnr, "FangSong")
#let song = (tnr, "SimSun")
#let hei = (tnr, "SimHei")
#let project(title: "", name: "", idnum: "", major1: "", major2: "", college: "", grade: "", advisor: "", jobtitle: "", unit:"", body) = {
  // Set the document's basic properties.
  // set document(title: title)
  counter(page).update(0)
  set page(
    margin: (left: 30mm, right: 30mm, top: 30mm, bottom: 20mm),
    paper: "a4"
  )
  set text(font: ("Times New Roman", "SimSun"), lang: "zh")
  // Flag (can be commented)
  // text(font: "SimHei", size: 16pt)[附件3]
  // Or 
  v(16pt)
  // Space
  v(69pt)
  v(20pt)
  // Title row.
  align(center)[
    #block(text(size: 30pt)[*本 科 毕 业 论 文*])
  ]
  // Space
  v(100pt)
  align(center)[
    #grid(columns: (3.53fr, 10.82fr), row-gutter: 5pt, 
    [#text(weight: "bold", size: 16pt)[课题名称：]], [#text(weight: "bold", font: fsong, size: 16pt)[#title]], [], [#line(length: 100%, stroke: (thickness: 0.5pt))])
  ]
  v(73.5pt)
  // Author information.
  grid(
    columns: (0.22fr, 0.29fr, 0.22fr, 0.29fr),
    rows: (14pt, 16pt, 2pt, 14pt, 16pt, 2pt, 14pt, 16pt, 2pt, 14pt, 16pt, 2pt),
    v(14pt),
    v(14pt),
    v(14pt),
    v(14pt),
    [#text(size: 14pt, font: song, tracking: 9pt, "学员姓名")#text(size: 14pt, font: song)[：]],
    align(center, text(size: 14pt, font: fsong, name)),
    [#text(size: 14pt, font: song, tracking: 56pt, "学号")#text(size: 14pt, font: song)[：]],
    align(center, text(size: 14pt, font: tnr, idnum)),
    v(14pt),
    line(length: 100%, stroke: (thickness: 0.5pt)),
    v(14pt),
    line(length: 100%, stroke: (thickness: 0.5pt)),
    v(14pt),
    v(14pt),
    v(14pt),
    v(14pt),
    // align(center, text(size: 14pt, font: fsong, major1)),
    [#text(size: 14pt, font: song, "首次任职专业")#text(size: 14pt, font: song)[：]],
    align(center, text(size: 14pt, font: fsong, major2)),
    text(size: 14pt, font: song, "学历教育专业："),
    align(center, text(size: 14pt, font: fsong, major1)),
    text(""),
    line(length: 100%, stroke: (thickness: 0.5pt)),
    text(""),
    line(length: 100%, stroke: (thickness: 0.5pt)),
    v(14pt),
    v(14pt),
    v(14pt),
    v(14pt),
    [#text(size: 14pt, font: song, tracking: 9pt, "命题学院")#text(size: 14pt, font: song)[：]],
    align(center, text(size: 14pt, font: fsong, college)),
    [#text(size: 14pt, font: song, tracking: 56pt, "年级")#text(size: 14pt, font: song)[：]],
    align(center, text(size: 14pt, font: fsong, grade)),
    text(""),
    line(length: 100%, stroke: (thickness: 0.5pt)),
    text(""),
    line(length: 100%, stroke: (thickness: 0.5pt)),
    v(14pt),
    v(14pt),
    v(14pt),
    v(14pt),
    [#text(size: 14pt, font: song, tracking: 9pt, "指导教员")#text(size: 14pt, font: song)[：]],
    align(center, text(size: 14pt, font: fsong, advisor)),
    [#text(size: 14pt, font: song, tracking: 56pt, "职称")#text(size: 14pt, font: song)[：]],
    align(center, text(size: 14pt, font: fsong, jobtitle)),
    text(""),
    line(length: 100%, stroke: (thickness: 0.5pt)),
    text(""),
    line(length: 100%, stroke: (thickness: 0.5pt)),
  )
  v(-12pt)
  grid(
    columns: (0.22fr, 0.80fr),
    rows: (14pt, 15pt, 8pt),
    text(size: 14pt, ""),
    text(size: 14pt, ""),
    [#text(size: 14pt, font: song, tracking: 9pt, "所属单位")#text(size: 14pt, font: song)[：]],
    align(center, text(size: 14pt, font: fsong, unit)),
    text(""),
    line(length: 100%, stroke: (thickness: 0.5pt)),
  )
  v(120pt)
  align(center)[#text(font: hei, size: 16pt)[国防科技大学教育训练部制]]
  pagebreak()
  set page(header: context {
  if counter(page).get().first() > 1 [
    _Lisa Strassner's Thesis_
    #h(1fr)
    National Academy of Sciences
  ]
})
  // Main body.
  // show par: set block(spacing: 6pt) // for older typst version
  set page(header: [
    #set par(spacing: 6pt)
    #align(center)[#text(size: 9pt)[国防科技大学本科毕业论文]]
    #v(-0.3em)
    #line(length: 100%, stroke: (thickness: 0.5pt))
    #v(-0.3em)
    #line(length: 100%, stroke: (thickness: 0.5pt))
])
  set par(spacing: 6pt)
  set par(justify: true, leading: 6pt, first-line-indent: 2em)
  let preface-outline = state("preface-outline", false)
  set page(footer: context [
    #v(-1em)
    #set par(spacing: 6pt)
    #let cur = counter(page).display("I")
    #line(length: 100%, stroke: (thickness: 0.5pt))
    #v(-0.2em)
    #align(center)[#text(font: tnr, size: 9pt)[第#cur 页]]
  ], numbering: (..n) => context {
  if preface-outline.get() {
    numbering("i", ..n)
  } else {
    numbering("1 / 1", ..n)
  }
})

  align(center)[#text(size: 16pt, font: hei)[目#h(1em)录]]
  v(-8pt)
  set text(size: 12pt)
  set par(leading: 1em, spacing: 1em)
  show outline.entry: it => {
    let seq = it.body.children
    let cname = seq.remove(0)
    [#cname#h(1em)#it.element.body #box(width: 1fr, it.fill) #it.page]
  }
  show outline.entry.where(level: 6): it => {
    preface-outline.update(true)
    let ebody = it.element.body
    [#text(weight: "regular")[#it.element.body] #box(width: 1fr, it.fill) #it.page]
    preface-outline.update(false)
  }
  show outline.entry.where(level: 7): it => {
    let loc = it.element.location()
    let page_n = loc.page-numbering()
    [#h(-3em) #it.element.body #box(width: 1fr, it.fill) #it.page]
  }
  show outline.entry.where(level: 1): it => {
    let seq = it.body.children
    let cname = seq.remove(0)
    [第#cname 章#h(1em)#it.element.body #box(width: 1fr, it.fill) #it.page]
  }
  outline(title: "", indent: 1em)
  pagebreak()
  
  set heading(numbering: "1.1")
  counter(heading).update(0)
  show heading.where(
    level: 6
  ): it => [
    #set align(center)
    #set par(leading: 0em, spacing: 0em)
    #set text(size: 16pt, font: hei, style: "normal", weight: "bold")
    #let cur = counter(heading).display()
    #it.body
  ]
  show heading.where(
    level: 7
  ): it => [
    #set align(center)
    #set par(leading: 0em, spacing: 0em)
    #set text(size: 16pt, font: hei, style: "normal", weight: "regular")
    #let cur = counter(heading).display()
    #it.body
  ]

  counter(page).update(1)
  set page(footer: context [
    #v(-1em)
    #set par(spacing: 6pt)
    #let cur = counter(page).display("i")
    #line(length: 100%, stroke: (thickness: 0.5pt))
    #v(-0.2em)
    #align(center)[#text(font: tnr, size: 9pt)[第#cur 页]]
  ])
  set par(spacing: 18pt)

  // align(center)[#text(size: 16pt, font: hei)[摘#h(1em)要]]
  heading([摘#h(1em)要], level: 6)
  v(16pt)
  text(font: song, size: 12pt)[
    随着无人机技术在交通监控、灾害管理等领域的广泛应用，传统2D目标检测方法受限于深度信息缺失和空间感知不足的问题，难以满足复杂场景下对目标三维空间状态精准感知的需求。针对无人机视角下3D目标检测存在的远距离小目标识别困难、遮挡场景鲁棒性不足等核心挑战，本文提出了一种多尺度时空特征融合的端到端3D目标检测算法。基于DETR3D模型框架，通过引入跨帧Query传递机制、运动补偿机制及特征金字塔网络（FPN）多尺度融合策略，构建了具有时空连续性建模能力的检测体系。研究工作主要围绕以下三方面展开：

    1、针对无人机动态场景中目标易受遮挡导致的空间特征缺失问题，设计了跨帧Query传递机制。通过建立历史帧高置信度Query与当前帧特征序列的时序关联，在Transformer解码过程中实现目标状态的连续跟踪。该机制将前一时刻检测结果作为初始查询向量，结合可学习参数构建时序特征融合序列，有效增强了模型对目标运动轨迹的表征能力。实验表明，该策略使DETR3D模型的mAP指标提升1.3个百分点，验证了时序信息对遮挡场景的补偿作用。

    2、为解决无人机平台运动引起的坐标系偏移问题，提出了基于位姿矩阵的运动补偿机制。通过将利用UAV3D数据集中提供的无人机位姿参数，构建帧间旋转平移变换矩阵，对历史Query进行坐标对齐预处理。上一帧目标坐标转换至当前帧参考系，为Transformer解码器提供更精确的初始位置估计。实验验证显示，该机制将定位误差（mATE）从0.494降低至0.490，证明了对模型收敛的促进作用。

    3、针对无人机视角下小目标特征弱的问题，引入特征金字塔网络实现多尺度特征融合。采用ResNet-101构建自上而下特征金字塔，通过横向连接融合高低层特征的空间定位信息与语义表达。该策略充分利用高分辨率特征图对小目标的空间敏感性和深层特征的语义判别力，在不显著增加计算量的前提下，使模型对远距离小目标的检测精度获得显著提升。综合实验结果显示，所提算法在UAV3D数据集上达到0.770的mAP和0.777的NDS指标，较基线模型分别提升16.0%和10.6%，验证了多尺度融合策略对无人机特殊场景的适应性。

    本研究系统探索了时空特征融合在无人机3D目标检测中的应用潜力，提出的改进方案在保持端到端框架优势的基础上，有效解决了动态遮挡、尺度变化等关键难题。研究成果可为无人机自主导航、智能监控等应用场景提供更精确的环境感知支撑，同时为通用航空视觉任务提供新的方法论参考。

  ]
  v(0pt)
  text(font: hei, size: 12pt)[关键词：]
  text(font: song, size: 12pt)[无人机；3D目标检测；时空特征融合；特征金字塔网络；Transformer；]

  pagebreak()
  set page(footer: context [
    #v(-1em)
    #set par(spacing: 6pt)
    #let cur = counter(page).display("i")
    #line(length: 100%, stroke: (thickness: 0.5pt))
    #v(-0.2em)
    #align(center)[#text(font: tnr, size: 9pt)[第#cur 页]]
  ])
  // align(center)[#text(size: 16pt, font: tnr, weight: "bold", "ABSTRACT")]
  heading([ABSTRACT], level: 6)
  v(16pt)
  text(font: song, size: 12pt)[With the widespread application of unmanned aerial vehicle (UAV) technology in fields such as traffic monitoring and disaster management, traditional 2D object detection methods face limitations in depth information acquisition and spatial perception, struggling to meet the demands for precise 3D spatial state awareness of targets in complex scenarios. To address core challenges in UAV-based 3D object detection—particularly difficulties in identifying distant small targets and insufficient robustness in occluded scenes—this paper proposes an end-to-end 3D object detection algorithm with multi-scale spatiotemporal feature fusion. Building on the DETR3D framework , we introduce a cross-frame query propagation mechanism, motion compensation strategy, and Feature Pyramid Network (FPN)-based multi-scale fusion approach to construct a detection system capable of spatiotemporal continuity modeling. Our research focuses on three key aspects:

  1.Cross-Frame Query Propagation for Occlusion Resilience:
  To mitigate spatial feature loss caused by occlusions in dynamic UAV scenes, we design a cross-frame query propagation mechanism. By establishing temporal associations between high-confidence queries from historical frames and current frame feature sequences, this method achieves continuous target tracking during Transformer decoder operations. It utilizes prior detection results as initial query vectors, integrating learnable parameters to form a temporal feature fusion sequence. This enhances the model's ability to represent target motion trajectories. Experimental results show a 1.3 percentage-point improvement in the mAP metric of the DETR3D framework, validating the compensatory effect of temporal information in occluded scenarios.

  2.Pose Matrix-Based Motion Compensation:
  To address coordinate drift caused by UAV platform movement, we propose a motion compensation mechanism leveraging pose matrices. Using UAV3D dataset  pose parameters, we construct inter-frame rotation-translation transformation matrices to align historical queries through coordinate preprocessing. By transforming previous frame coordinates into the current reference system, the Transformer decoder receives more accurate initial position estimates. Experiments demonstrate reduced localization error (mATE) from 0.494 to 0.490, proving the efficacy of physical alignment in accelerating model convergence.

  3.Multi-Scale Feature Fusion via FPN:
  To strengthen weak feature representations of small targets in UAV perspectives, we implement a ResNet-101-based top-down FPN with lateral connections, integrating high-level semantic features and low-level spatial details. This strategy exploits high-resolution feature maps' sensitivity to small targets and deep features' semantic discriminability, achieving significant detection accuracy improvements for distant targets without substantial computational overhead. Comprehensive experiments on the UAV3D dataset show our method achieves 0.770 mAP and 0.777 NDS metrics—a 16.0% and 10.6% improvement over baseline models respectively—validating its adaptability to UAV-specific scenarios.

  This study systematically explores the potential of spatiotemporal feature fusion in UAV 3D object detection. While preserving the advantages of end-to-end frameworks, our solutions effectively tackle critical challenges like dynamic occlusions and scale variations. The results provide enhanced environmental perception capabilities for UAV applications such as autonomous navigation and intelligent surveillance, while offering novel methodological references for general aviation vision tasks.
]
  v(0pt)
  text(font: hei, size: 12pt, weight: "bold")[KEY WORDS: ]
  // 无人机；3D目标检测；时空特征融合；特征金字塔网络；Transformer；
  text(font: song, size: 12pt)[UAV, 3D Object Detection, Spatiotemporal Feature Fusion, FPN, Transformer]
  pagebreak()

  counter(page).update(1)
  set page(footer: context [
    #v(-1em)
    #set par(spacing: 6pt)
    #let cur = counter(page).display("1")
    #line(length: 100%, stroke: (thickness: 0.5pt))
    #v(-0.2em)
    #align(center)[#text(font: tnr, size: 9pt)[第#cur 页]]
  ])
  // align(center)[#text(size: 16pt, font: hei)[前#h(1em)言]]
  // heading([前#h(1em)言], level: 6)
  // v(16pt)
  // set par(spacing: 12pt, leading: 1em)

  // text(font: song, size: 12pt)[
  //   前言内容。

  //   前言第二段。

  //   前言第三段。
    
  //   ]
  
  // set heading(numbering: "1.1")
  // counter(heading).update(0)
  show heading.where(
    level: 1
  ): it => [
    #set align(center)
    #set par(leading: 0em, spacing: 0em)
    #set text(size: 16pt, font: hei, style: "normal", weight: "regular")
    #let cur = counter(heading).display()
    第#cur 章#h(1em)#it.body
    #v(1em)
  ]

  show heading.where(
    level: 2
  ): it => box(width: 100%)[
    #set par(leading: 0em, spacing: 0em)
    #set text(size: 14pt, font: hei, style: "normal", weight: "regular")
    #let cur = counter(heading).display()
    #cur#h(1em)#it.body
    #v(1em)
  ]

  show heading.where(
    level: 3
  ): it => box(width: 100%)[
    #set text(size: 12pt, font: hei, style: "normal", weight: "regular")
    #let cur = counter(heading).display()
    #cur#h(1em)#it.body
  ]

  set text(size: 12pt)
  set par(leading: 1em)
  body

  pagebreak()

  heading([#text(weight: "bold")[致#h(1em)谢]], level: 7)
  v(16pt)
  set par(spacing: 12pt, leading: 1em)

  text(font: song, size: 12pt)[

  逝者如斯夫，不舍昼夜。入学的情景犹在昨日，眨眼间我的大学本科生活却即将结束了。四年的光阴，珍藏了太多的情感，在我的心中汹涌澎湃，久不能平息。在此结束之际，我想借此机会向求学路上给予我帮助的师长和亲友表达我最真挚的感谢。

  一朝沐杏雨，终生念师恩。我首先要感谢我的全程导师邓明堂副研究员。仍记得初次与老师相见，老师向我揭开了量子计算神秘的面纱；也记得在实验室亲眼见到稀释制冷机和超算集群的震撼。邓老师在我最迷茫时为我指引了大学的前进方向，告诉我大学的学习要广泛探索各个领域、深入研究一个方向，做“ T ”型人才。后续我选择了自己感兴趣的AI领域，老师为我提供了许多指导与帮助，为我推荐了相关领域的专家。在毕设过程中，我因在校外而有诸多不便。遇到系统上的问题，尽管明天有一场重要会议而忙得不可开交，老师仍然腾出时间帮我修改，令我倍感温暖。在师门的四年，邓老师教与我的不仅是学术上的知识，更教会我勤勉、认真、负责的品质，这些品质将是我一生的财富，伴随我度过今后的人生。在此，我衷心感谢邓老师一路以来的教导、呵护与关怀。


  海内存知己，天涯若比邻。感谢我的室友对我的包容与陪伴。大学我总是拼命压榨自己，借着年青，以为意志总能够战胜身体，熬夜是我稀疏平常的习惯。我仍贪心地想要借闹钟早起，往往先醒的不是我，而是我的室友们。起床后听到的是“你的闹钟又响了，我帮你关了”，我对此非常抱歉，也感谢你们的不杀之恩。平时的寝室是快乐的，有一起在战地占领折钵山的豪情，有Liar's Bar的钩心斗角，还有一起聚餐的温馨以及体育馆的挥洒青春（以及与香蕉、坚果的快乐时光）。谢谢你们，CC、博、明鑫、山。

  最后我要感谢我的师兄李垚博士。师兄在毕设期间为我选择方向，指点迷津。当我实验遇到瓶颈时，师兄常常同我一起探讨思路，为我分享各种论文。师兄平易近人，时常同我谈论生活中的事情，嘘寒问暖。在毕设期间，我对与科研的理解更加深入，对于自己科研领域的认知也更加深入，这都源于师兄的耳濡目染。
  
  最后的最后，感谢我的父母一直以来的关心与支持，让我大学期间能够自由的学习我感兴趣的知识；感谢刘万伟教授和毛晓光教授在大学期间对我的帮助与启发，让我对于计算机和数学更加喜欢；感谢田植良副研究员和赵潇然学姐在大学本科期间对我帮助，让我提前接触了科研并且学习到了很多前沿知识。

  我的本科生活的确是要结束了。

  \

  悄悄的我走了，正如我悄悄的来；
  
  我挥一挥衣袖，不带走一片云彩。

  ]

  pagebreak()
  align(center)[#text(size: 16pt, font: hei)[参考文献]]
  v(16pt)
  set text(size: 10.5pt)
  bibliography("references.bib", style: "gb-7714-2015-numeric", title:none)
}