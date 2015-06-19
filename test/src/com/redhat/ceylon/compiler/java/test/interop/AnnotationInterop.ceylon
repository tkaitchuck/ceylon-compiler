import javax.annotation{generated, 
    postConstruct, 
    preDestroy, 
    resource,
    Resource {
        AuthenticationType{
            application=\iAPPLICATION
        }
    }
}
import java.lang {
    Thread {
        State {
            runnable=\iRUNNABLE,
            neww=\iNEW,
            blocked=\iBLOCKED
        }
    }
}
import java.util.jar {
    JarFile
}

@nomodel
generated{
    \ivalue={"Some", "code generator name"};
}
javaAnnotationPrimitives {
    b=true;
    o=Byte(8);
    s=16;
    i=32;
    l=64;
    f=32.0;
    d=64.0;
    str="";
    
    ba={true};
    oa={Byte(8)};
    sa={16};
    ia={32};
    la={64};
    fa={32.0};
    da={64.0};
    stra={""};
}
javaAnnotationClass {
    clas=`class String`;
    classRaw=`class String`;
    classWithBound=`class Exception`;
    classExact=`class String`;
    classes={`class String`, `class Boolean`, `interface Sequential`};
    classesRaw={`class String`, `class Boolean`, `interface Sequential`};
    classesWithBound={`class Exception`, `class AssertionError`};
    classesExact={`class String`};
}
javaAnnotationEnum {
    threadState=neww;
    threadStates={runnable, blocked};
}
javaAnnotationAnnotation {
    annotation=javaAnnotationEnum{
        threadState=neww;
        threadStates={runnable, blocked};
    };
    annotations={javaAnnotationEnum{
        threadState=neww;
        threadStates={runnable, blocked};
    }};
}
javaAnnotationAcronym
javaAnnotationLowercase
class AnnotationInterop() {
    
    resource{
        name="tom";
        authenticationType=application;
        type=`AnnotationInterop`;
    }
    shared variable String tom = "";
    
    postConstruct
    shared void afterConstrution() {}
    
    preDestroy
    shared void beforeDestruction() {}
}

class CPAnnoTest2 {
    generated({"by you"})
    shared new (generated({"by me"}) String x) { }
    shared new other(generated({"by me"}) String x) { }
}

generated({JarFile.\iMANIFEST_NAME})
void bug2103() {}