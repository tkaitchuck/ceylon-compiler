@noanno
class CtorAbstractCtorSuper {
    shared new foo(Boolean b) {
        checker.note("super");
    }
}

@noanno
class CtorAbstractCtorPartial extends CtorAbstractCtorSuper {
    Integer x;
    Integer y;
    checker.note("a");
    abstract new partial(Integer x) extends foo(true) {
        checker.note("Partial");
        this.x = x;
    }
    checker.note("b");
    shared new rest(Integer y) extends partial(1) {
        checker.note("Rest");
        this.y = y;
        print(this.x);
    }
    print(this.x);
    checker.note("c");
}
@noanno
class CtorAbstractCtorPartialShared extends CtorAbstractCtorSuper {
    shared Integer x;
    shared Integer y;
    checker.note("a");
    abstract new partial(Integer x) extends foo(true) {
        checker.note("Partial");
        this.x = x;
    }
    checker.note("b");
    shared new rest(Integer y) extends partial(1) {
        checker.note("Rest");
        this.y = y;
    }
    checker.note("c");
}
@noanno
class CtorAbstractCtorPartialCaptured extends CtorAbstractCtorSuper {
    Integer x;
    Integer y;
    checker.note("a");
    abstract new partial(Integer x) extends foo(true) {
        checker.note("Partial");
        this.x = x;
    }
    checker.note("b");
    shared new rest(Integer y) extends partial(1) {
        checker.note("Rest");
        this.y = y;
    }
    checker.note("c");
    shared Integer capture() {
        return x+y;
    }
}


@noanno
class CtorAbstractCtorPartialVariable extends CtorAbstractCtorSuper {
    variable Integer x;
    variable Integer y;
    checker.note("a");
    abstract new partial(Integer x) extends foo(true) {
        checker.note("Partial");
        this.x = x;
        object xCapturer {
            shared Integer capture(Integer incr) {
                return outer.x+=incr;
            }
        }
        xCapturer.capture(1);
    }
    checker.note("b");
    shared new rest(Integer y) extends partial(1) {
        object xCapturer {
            shared Integer capture(Integer incr) {
                return outer.x+=incr;
            }
        }
        xCapturer.capture(4);
        checker.note("Rest");
        this.y = y;
        object yCapturer {
            shared Integer capture(Integer incr) {
                return outer.y+=incr;
            }
        }
        yCapturer.capture(1);
    }
    object xCapturer3 {
        shared Integer capture(Integer incr) {
            return outer.x+=incr;
        }
    }
    xCapturer3.capture(8);
    object yCapturer2 {
        shared Integer capture(Integer incr) {
            return outer.x+=incr;
        }
    }
    yCapturer2.capture(2);
    checker.note("c");
    print(x);
    print(y);
}
@noanno
class CtorAbstractCtorPartialSharedVariable extends CtorAbstractCtorSuper {
    shared variable Integer x;
    shared variable Integer y;
    checker.note("a");
    abstract new partial(Integer x) extends foo(true) {
        checker.note("Partial");
        this.x = x;
        object xCapturer {
            shared Integer capture(Integer incr) {
                return outer.x+=incr;
            }
        }
        xCapturer.capture(1);
    }
    checker.note("b");
    shared new rest(Integer y) extends partial(1) {
        object xCapturer {
            shared Integer capture(Integer incr) {
                return outer.x+=incr;
            }
        }
        xCapturer.capture(4);
        checker.note("Rest");
        this.y = y;
        object yCapturer {
            shared Integer capture(Integer incr) {
                return outer.y+=incr;
            }
        }
        yCapturer.capture(1);
    }
    object xCapturer3 {
        shared Integer capture(Integer incr) {
            return outer.x+=incr;
        }
    }
    xCapturer3.capture(8);
    object yCapturer2 {
        shared Integer capture(Integer incr) {
            return outer.x+=incr;
        }
    }
    yCapturer2.capture(2);
    checker.note("c");
    print(x);
    print(y);
}
@noanno
class CtorAbstractCtorPartialCapturedVariable extends CtorAbstractCtorSuper {
    variable Integer x;
    variable Integer y;
    checker.note("a");
    abstract new partial(Integer x) extends foo(true) {
        checker.note("Partial");
        this.x = x;
        object xCapturer {
            shared Integer capture(Integer incr) {
                return outer.x+=incr;
            }
        }
        xCapturer.capture(1);
    }
    checker.note("b");
    shared new rest(Integer y) extends partial(1) {
        object xCapturer {
            shared Integer capture(Integer incr) {
                return outer.x+=incr;
            }
        }
        xCapturer.capture(4);
        checker.note("Rest");
        this.y = y;
        object yCapturer {
            shared Integer capture(Integer incr) {
                return outer.y+=incr;
            }
        }
        yCapturer.capture(1);
    }
    object xCapturer3 {
        shared Integer capture(Integer incr) {
            return outer.x+=incr;
        }
    }
    xCapturer3.capture(8);
    object yCapturer2 {
        shared Integer capture(Integer incr) {
            return outer.x+=incr;
        }
    }
    yCapturer2.capture(2);
    checker.note("c");
    print(x);
    print(y);
    shared Integer capture() {
        return x+y;
    }
}

@noanno
class CtorAbstractCtorGeneric<T> extends CtorAbstractCtorSuper {
    T? x;
    T? y;
    checker.note("a");
    abstract new partial(T? x=null) extends foo(true) {
        checker.note("Partial");
        this.x = x;
    }
    checker.note("b");
    shared new rest(T? y=null) extends partial() {
        checker.note("Rest");
        this.y = y;
        print(this.x);
    }
    print(this.x);
    checker.note("c");
}

shared void runCtorAbstractCtor() {
    checker.reset();
    CtorAbstractCtorPartial.rest(1);
    checker.check("[super, a, Partial, b, Rest, c]");
    checker.reset();
    CtorAbstractCtorPartialShared.rest(1);
    checker.check("[super, a, Partial, b, Rest, c]");
    checker.reset();
    CtorAbstractCtorPartialCaptured.rest(1);
    checker.check("[super, a, Partial, b, Rest, c]");
    
    checker.reset();
    CtorAbstractCtorPartialVariable.rest(1);
    checker.check("[super, a, Partial, b, Rest, c]");
    checker.reset();
    CtorAbstractCtorPartialSharedVariable.rest(1);
    checker.check("[super, a, Partial, b, Rest, c]");
    checker.reset();
    CtorAbstractCtorPartialCapturedVariable.rest(1);
    checker.check("[super, a, Partial, b, Rest, c]");
    checker.reset();
    CtorAbstractCtorGeneric.rest(1);
    checker.check("[super, a, Partial, b, Rest, c]");
}