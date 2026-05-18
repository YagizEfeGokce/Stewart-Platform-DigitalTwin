








**FACULTY of ENGINEERING and NATURAL SCIENCES**


**MULTIDISCIPLINARY FACULTY ELECTIVE**

**ENS00****3**** ****Digital Twins for Health Sciences**


**PROJECT REPORT**







**GENE****RAL INFORMATION**





**SUMMARY**















**ORIGINALITY**

** 1.1. ****Importance of the Topic, Originality of the Research Topic and Research Questions/Hypothesis**




**Purpose**** ****and**** ****Goals**









**METHODOLOGY**





**PROJE****CT MANAGEMENT**

**Work –**** ****Time Schedule**


**Work – Time Schedule ****(*)**



(*) Rows and columns in the table can be expanded and duplicated as needed.
**Risk ****Management**

**                                                       ****RISK MANAGEMENT**** ****TABLE*******
(*) Rows and columns in the table can be expanded and duplicated as needed.






**Research Opportunities**
In this section, the infrastructure/equipment (laboratory, vehicle, machinery-equipment, etc.) facilities that exist in the institutions and organizations where the project will be carried out and will be used in the project are specified.

**RESEARCH OPPORTU****N****ITIES ****TABL****E**** ****(*)**

(*) Rows and columns in the table can be expanded and duplicated as needed.


**IMPLICATIONS**

  If the proposed study is carried out successfully, the common effects expected to be obtained from the research, in other words, what outputs, results and effects will be obtained from the research are given in the table below.

**EXPECTED IMPLICATIONS TABLE of the RESEARCH**


**FINDING**
At the current stage of the project, the primary findings are related to the mechanical modeling and preliminary validation of the Stewart platform design.
The measurements obtained from the laboratory components have been successfully incorporated into the SolidWorks model, resulting in a geometrically consistent representation of the physical system. This indicates that the developed CAD model provides a reliable foundation for subsequent simulation and control development.
Preliminary analyses, including motion studies and interference checks, suggest that the mechanical design is capable of achieving the intended range of motion without major collisions or structural inconsistencies. These observations support the feasibility of the proposed system architecture.
At this stage, the digital twin implementation in MATLAB Simscape has not yet been completed; therefore, performance metrics such as positioning accuracy, synchronization latency, and RMSE-based validation are planned for evaluation in the next phase of the project.

**CONCLUSION**
This study presents the ongoing development of a 6-DOF Stewart Platform system with the objective of integrating a digital twin framework for medical applications. At the current stage, the project has successfully established a geometrically accurate mechanical model in SolidWorks based on laboratory measurements, providing a reliable foundation for further development.
The adopted multidisciplinary methodology, which separates mechanical system design and digital twin implementation, has enabled a structured and scalable approach to the project. While the integration with MATLAB Simscape has not yet been completed, the planned workflow outlines a clear pathway for achieving real-time simulation and control capabilities.
Preliminary findings indicate that the mechanical design is feasible and suitable for the intended range of motion. However, further work is required to implement the digital twin environment, validate system performance, and evaluate key metrics such as synchronization latency and positioning accuracy.
Future work will focus on completing the simulation integration, developing control algorithms, and establishing communication between physical and virtual systems. The overall objective is to produce a functional prototype that can support medical training applications, including robotic-assisted procedures and rehabilitation systems.
**APPENDICES**
**Sub-Teams**
The "Sub-Teams" part provides an in-depth overview of the design and construction efforts dedicated to individual teams of the project.

** ****Mechanical**** Engineering Team **
**Overview**
The Mechanical Engineering sub-team is responsible for the design, modeling, and structural development of the Stewart platform. Their primary role is to ensure that the physical system is accurately represented through precise geometric modeling and kinematic consistency.
At the current stage, the team focuses on generating a high-fidelity 3D CAD model in SolidWorks based on laboratory measurements. In addition, the team defines the mechanical constraints, motion limits, and overall system architecture that will serve as the foundation for future digital twin integration.


**Literature Survey**

Existing studies on Stewart platforms emphasize their effectiveness in applications requiring precise 6-DOF motion control, such as flight simulators and robotic systems. More recent research highlights the growing importance of integrating such systems with digital twin environments to improve simulation accuracy and predictive capabilities.
In this context, the literature indicates a transition from purely mechanical modeling toward integrated simulation frameworks, where accurate geometric and kinematic representation plays a critical role in system performance.
.

**Constraints**
A constraint refers to any factor that imposes limits on the choices and design decisions made throughout the project lifecycle. For the Stewart Platform Digital Twin and Motion Control System, the most critical performance constraint is the synchronization latency, which must be strictly maintained at less than 50 ms to ensure real-time high-fidelity feedback between the physical platform and the MATLAB Simscape environment. In terms of mechanical precision, the system is constrained to a positioning accuracy of 0.1 mm, a requirement that is fundamental for meeting the stringent standards of professional medical simulators and robotic-assisted surgery training. Architectural fidelity is further limited by the physical dimensions and 6-DOF motion capabilities of the mechanical components measured within the laboratory, requiring 100% dimensional accuracy during the CAD modeling stage to avoid interference or stability issues. Statistical verification of the findings relies on the constraint that the Root Mean Square Error (RMSE) must remain within the predefined accuracy margins to validate the synchronization effectiveness. Furthermore, research operations are confined to the 8-week work schedule and the available infrastructure of the XR Laboratory ANK-503, ensuring that all experimental data collection and sub-team integrations are carried out within these defined temporal and resource-based boundaries. Following established academic protocols, any statistical analysis performed must adhere to a significance threshold where the p-value is at most 0.05 to confirm that the observed outcomes are not due to chance.
**Requirements**
The requirements for the Stewart Platform Digital Twin project are established to ensure both the mechanical integrity and the operational effectiveness of the system within health science applications. Functionally, the project must accomplish a high-fidelity 3D CAD modeling process based on the precise empirical measurement of physical laboratory components to ensure absolute architectural and structural fidelity. The system is required to solve complex inverse kinematic equations to translate various platform poses into specific actuator lengths, which are then integrated into a MATLAB Simscape environment for multi-domain physical simulation. This digital twin interface must be capable of synchronizing with the physical platform with a latency of less than 50 ms to provide the real-time feedback necessary for high-stakes medical procedures. Performance requirements further dictate a positioning accuracy of 0.1 mm, which is essential to meet the stringent technical standards of professional medical simulators used in robotic surgery training and patient rehabilitation. To validate these engineering outcomes, the methodology adheres to professional research protocols by requiring at least 10 expert opinions to assess the practical and managerial implications of the motion control system. This collaborative requirement ensures that the finalized 6-DOF parallel manipulator is not only a successful engineering prototype but also a verified, practice-ready solution for clinical training contexts.
**Methodology**
The research methodology utilizes a structured engineering workflow that begins with the empirical measurement of physical laboratory components to ensure high architectural fidelity within a finalized SolidWorks 3D assembly. This mechanical design is then exported to the MATLAB Simscape environment to model multi-domain physical dynamics, such as mass, inertia, and joint friction, creating a high-fidelity digital twin suitable for health science simulations. The effectiveness of the system is verified through Root Mean Square Error (RMSE) analysis, which measures the deviation between the digital twin's predicted position and actual physical coordinates during various 6-DOF motion profiles. This systematic approach, integrated with a strict 8-week work schedule and specific work packages, ensures that the digital twin remains a precise and verified representation of the physical Stewart platform.



**Computer / Software Engineering Team**
The Software and Computer sub-team sections are intentionally left blank at this stage. While the Mechanical team focused on completing the initial tasks for the midterm, the software and computer teams are scheduled to begin their active development phase following the midterm.
**Overview**
Commence with a brief introduction to the sub-team, highlighting their role within the project. Define the functional and performance prerequisites of your sub-system. Outline the tasks of your team must execute and the level of performance to meet the objectives of project requirements.
**Literature Survey**
Perform a comprehensive review of existing literature to explore technologies and methodologies dealing with your sub-system.
**Constraints**
A constraint refers to any factor that imposes limits on the choices you can make in your design (technology, policy, regulation, performance constraint). Identify and explore the primary constraints that must be taken into account for your project.

**Requirements**
Provide a concise summary covering functional and non-functional requirements (the necessary tasks the project must accomplish) and performance requirements (the level of effectiveness the project must achieve in executing its tasks).

**Methodology**
Explain in detail the methods and research techniques applied in the research project dealing with your sub-system**.**
**System Integration**
Explain the integration of sub-systems to form the final project and assessing its functionalities and performance. It's crucial to conduct verification through well-structured experiments and thorough analysis of data. All sub-teams are required to contribute to this phase.
**EVALUATION FORM**




**APPX****-1****:  ****REFERENCES**

Use APA-style for references and citations. 


Aytaç Adali, E., Öztaş, G. Z., Öztaş, T., & Tuş, A. (2022). Assessment of European cities from a smartness perspective: An integrated grey MCDM approach. *Sustainable Cities and Society*, 84, 104021.  
Savaş, S., Cenani, Ş., & Çağdaş, G. (2021). Selection of Emergency Assembly Points: A Case Study for the Expected Istanbul Earthquake. In Y. I. Topcu, Ö. Özaydın, Ö. Kabak, & Ş. Önsel Ekici (Eds.), *Multiple Criteria Decision Making: Beyond the Information Age* (pp. 37–67). Springer International Publishing.  
Taherdoost, H., & Madanchian, M. (2023). Multi-Criteria Decision Making (MCDM) Methods and Concepts. *Encyclopedia*, 3(1), Article 1.  
Topcu, Y. I., Özaydın, Ö., Kabak, Ö., & Önsel Ekici, Ş. (Eds.). (2021). *Multiple Criteria Decision Making: Beyond the Information Age*. Springer International Publishing.  


| Student ID | Name | Surname | Department |
| --- | --- | --- | --- |
| 220908170 | Buse | Şahin | Mechanical Engineering |
| 210908019 | Berk Özyıldırım | Özyıldırım | Mechanical Engineering |
| 2309081022 | Umut Muhammet | Uluhan | Mechanical Engineering |
| 2309111075 | Yağız Efe | Gökçe | Software Engineering |
| 22090169 | Elif Eylül | Kavrazlı | Computer Engineering |


| Project Name: | Stewart Platform Digital Twin and Motion Control System |
| --- | --- |
| Course Instructor: | Dr. Öğr. Üyesi Şenol Pişkin |


| The project, titled "Stewart Platform Digital Twin and Motion Control System," is being developed within the ENS003 course, Digital Twins for Health Sciences. The aim of the project is to design a high-precision six-degree-of-freedom (6-DOF) parallel manipulator and to establish its integration with a real-time digital twin environment for potential medical applications, such as robotic surgery training and patient rehabilitation.

At the current stage of the project, the primary focus has been on the mechanical design and modeling of the Stewart platform. The scope so far includes the geometric measurement of available laboratory components and the development of a structurally accurate model in SolidWorks. This process ensures that the digital representation accurately reflects the physical system, forming a reliable basis for future simulation and control studies.

A multidisciplinary framework has been adopted, in which the mechanical engineering team is responsible for the design, modeling, and kinematic structure of the system, while the computer engineering and software engineering team will focus on the development of the digital twin in MATLAB Simscape or a similar simulation platform. At this stage, the digital twin component remains in the planning and preparation phase.

Preliminary observations indicate that the developed SolidWorks model successfully represents the intended geometry and motion structure of the Stewart platform. However, further work is required to validate kinematic behavior, actuator integration, and real-time synchronization capabilities.

Future work will focus on transferring the mechanical model into a simulation environment, establishing communication between physical and virtual systems, and implementing motion control algorithms. Particular attention will be given to minimizing synchronization delays and improving system accuracy.

The expected outcome of the project is the development of a cost-effective and functional prototype that can support educational and research activities in medical engineering applications. |
| --- |
| Keywords: Stewart Platform, Digital Twin, MATLAB Simscape, 6-DOF, Health Sciences. |


| The importance of high-precision motion control in medical applications is widely recognized, particularly in areas such as robotic-assisted surgery and physical rehabilitation, where accurate six-degree-of-freedom (6-DOF) motion is essential. Although Stewart platforms are well-established in fields such as aviation and industrial simulation, their application within a digital twin framework for health sciences has the potential to provide a novel contribution.
The originality of this research lies in proposing a system that combines a physically measured and validated mechanical structure with a synchronized digital representation. At the current stage, the project focuses on developing a geometrically accurate model based on laboratory measurements. In the subsequent phase, this model is planned to be integrated into MATLAB Simscape or a similar simulation platform to enable multi-domain analysis and support real-time interaction between physical and virtual systems.
This approach aims to address certain limitations of conventional medical training tools by enabling more accurate prediction of mechanical behavior and reducing potential errors through digital simulation prior to physical implementation. Conceptually, the project adopts a multidisciplinary framework, separating mechanical system development and digital twin implementation into coordinated but distinct processes.
The primary research question of this study is:
How can the integration of a digital twin environment improve the accuracy and reliability of motion control in a 6-DOF Stewart platform for medical applications?
The hypothesis of the study is that:
the integration of a digital twin model with a laboratory-based 6-DOF parallel manipulator will improve system accuracy and reduce potential discrepancies compared to conventional, non-synchronized systems. |
| --- |


| The primary purpose of this research proposal is to design and develop a Stewart Platform system, with planned integration of a real-time digital twin to be implemented in MATLAB Simscape or a similar simulation environment, specifically tailored for health science applications. The project aims to establish a high-fidelity simulation framework for medical procedures, such as robotic-assisted surgery and rehabilitation, by linking physical mechanical systems with their digital counterparts.

The specific and measurable objectives of the project are defined as follows:

Finalizing a high-precision 3D CAD model and mechanical assembly in SolidWorks, based on laboratory measurements of physical components, to ensure a high level of structural and geometric fidelity. 

Developing a digital twin interface within the simulation environment, with a target synchronization latency below 50 ms, to enable near real-time interaction between the physical and virtual systems. 

Implementing inverse kinematic control algorithms within the digital environment, aiming to achieve a target positioning accuracy of approximately 0.1 mm, in line with the performance expectations of medical simulation systems.

Conducting planned system validation through experimental testing and data analysis to evaluate performance, limitations, and applicability in a clinical training context. 

These objectives are intended to be achieved within an 8-week research period through a multidisciplinary approach, in which mechanical system development and digital twin implementation are carried out by coordinated but distinct sub-teams. The expected outcome is the development of a functional and scalable prototype that can support further research and educational applications |
| --- |


| The research methodology for the Stewart Platform Digital Twin follows a structured engineering workflow, detailed as follows:

Empirical Data Collection & CAD Modeling:

The study begins with the precise measurement of mechanical components available in the laboratory environment to ensure a high level of geometric and structural fidelity. These measurements have been used to develop a detailed 3D assembly in SolidWorks, defining the mechanical constraints and motion limits of the 6-DOF system.
 
Digital Twin Development via MATLAB Simscape:

In the next phase of the project, the finalized SolidWorks model is planned to be exported to MATLAB Simscape or a similar simulation platform. This step aims to enable the modeling of multi-domain physical parameters, including mass, inertia, and joint characteristics, with the goal of developing a functional digital twin environment. 

Variable Identification:

The independent variables of the system are defined as the individual actuator lengths and motor input parameters. The dependent variables consist of the resulting Cartesian coordinates (x, y, z) and orientation angles (roll, pitch, yaw) of the moving platform. 

Statistical Verification:

To evaluate system performance, Root Mean Square Error (RMSE) analysis is planned to be utilized. This method will quantify the deviation between the predicted outputs of the digital twin model and experimental data obtained from the physical system under different motion conditions. 

Feasibility & Work Packages:

Preliminary analyses, including motion studies and interference checks conducted in SolidWorks, suggest that the current design is free from major collisions. The overall methodology is aligned with the defined 8-week project schedule and structured into coordinated work packages, ensuring systematic progress toward the integration of mechanical and digital subsystems. |
| --- |


| Work No | Name and goals of the work | Responsible Student | Time Range
(... - ... Week) | Success Criteria and Contribution to the Success of the Project |
| --- | --- | --- | --- | --- |
| 1 | Mechanical Design and Assembly: Finalizing the 3D CAD modeling and assembly of the 6-DOF Stewart Platform. | Umut Muhammet Uluhan, Berk Özyıldırım,Buse Şahin | 1-2 | 100% collision-free assembly verified in SolidWorks and structural stability for medical motion profiles. |
| 2 | Kinematic Analysis: Solving inverse kinematic equations to translate platform poses into specific actuator lengths. | Buse Şahin, Umut Muhammet Uluhan, Berk Şahin | 2-3 | Mathematical validation of actuator motion with less than %1 error margin for precise medical movement. |
| 3 | Simscape Digital Twin Setup: Exporting the CAD model to MATLAB Simscape and defining multi-domain physical parameters (mass, inertia). | Yağız Efe Gökçe, Elif Eylül Kavrazlı | 3-5 | Functional Simscape block diagram that accurately represents the physical system's dynamics. |
| 4 | System Integration & Control: Synchronizing control logic with the Simscape model to achieve real-time motion feedback. | Yağız Efe Gökçe, Elif Eylül Kavrazlı | 5-7 | Synchronization latency reduced to less than 50 ms to meet high-fidelity medical simulation requirements. |
| 5 | Experimental Verification: Testing the system performance using medical motion profiles and evaluating RMSE accuracy. | Yağız Efe Gökçe, Elif Eylül Kavrazlı, Buse Şahin, Umut Muhammet Uluhan, Berk Özyıldırım | 8 | 0.1mm positioning accuracy achieved during simulated surgical or rehabilitation scenarios. |


| Work No | Major Risks | Risk Management (Plan B) |
| --- | --- | --- |
| 1 | Measurement & Assembly Errors: Potential inaccuracies in measuring physical lab components leading to interference or stability issues in the CAD model. | Use high-precision digital calipers and perform cross-verification measurements by multiple team members to ensure %100 dimensional accuracy. |
| 2 | Digital Twin Integration Issues: Compatibility errors or loss of kinematic constraints when exporting the SolidWorks model to the MATLAB Simscape environment. | Simplify the assembly geometry before export and manually redefine kinematic joints/coordinate systems within Simscape to ensure synchronization. |


| Infrastructure/Equipment Type and Model in the Organization
(Laboratory, Vehicle, Machinery-Equipment, etc.) | Purpose of Use in the Project |
| --- | --- |
| XR Laborotory ANK-503 | This will allow us to work on the project as a group. |
| High-Precision Measurement Tools (Digital Calipers, etc.) | Employed to obtain exact dimensions from physical lab parts to ensure architectural fidelity in the digital model. |


| Implication Types | Expected Outputs, Results, Findings, and Impacts |
| --- | --- |
| Scientific/Academic 
(Article, Paper, Book Chapter, Book) | The project aims to produce a conference paper or a technical article focusing on the integration of a 6-DOF Stewart platform with MATLAB Simscape for medical applications. The research will contribute to the literature by documenting how real-time digital twin synchronization improves the accuracy of motion-based procedures in health sciences. |
| Economic/Commercial/Social
(Product, Prototype, Patent, Utility Model, Production Permit, Variety Registration, Spin-off/Start-up Company, Audiovisual Archive, Inventory/Database/Documentation Production, Copyrighted Work, Media Coverage, Fair, Project Market , Workshop, Training etc. Scientific Activity, Institution/Organization That Will Use Project Results, etc. Other common effects) | The primary output is a high-precision mechanical prototype and a synchronized digital twin interface developed in Simscape, serving as an economic tool for robotic surgery training and rehabilitation. Additionally, the project provides comprehensive documentation and a technical database for inverse kinematic control and real-time feedback systems. |
| Training Researchers and Creating New Project(s) 
(Master's/PhD Thesis, National/International New Project) | This study facilitates the training of researchers by enhancing the multidisciplinary teamwork skills of the mechanical and computer engineering sub-teams. Furthermore, the verified Simscape infrastructure and laboratory-verified platform will serve as a foundation for future national or international research projects. |


| Learning Outcome | Section | Section | Section | Section | Section |
| --- | --- | --- | --- | --- | --- |
| Learning Outcome | 1 | 2 | 3 | 4 | 5 |
| 1) Gains multidisciplinary teamwork skills |  |  |  |  |  |
| 2) Defines and solves complex engineering problems and turns them into practice |  |  |  |  |  |
| 3) Gain the skills to conduct scientific research, prepare reports and make presentations |  |  |  |  |  |
| 4) Gains project workflow planning and project management skills |  |  |  |  |  |


| Student # | Student | Section | Section | Section | Section | Section | Score |
| --- | --- | --- | --- | --- | --- | --- | --- |
| Student # | Student | 1
(20) | 2
(20) | 3
(20) | 4
(20) | 5
(20) | Score |
| 1 | Name:
ID: |  |  |  |  |  | / 100 |
| 2 | Name:
ID: |  |  |  |  |  | / 100 |
| 3 | Name:
ID: |  |  |  |  |  | / 100 |
| 4 | Name:
ID: |  |  |  |  |  | / 100 |
