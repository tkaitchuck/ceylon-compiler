@noanno
interface IPackageQualified {
    
}
@noanno
class CPackageQualified<T>() satisfies package.IPackageQualified 
        given T satisfies package.IPackageQualified {
}
@nomodel
see(`interface package.IPackageQualified`)
class SubPackageQualified() 
        extends CPackageQualified<package.IPackageQualified>(){//TODO extends
    void m() {
        package.SubPackageQualified();
        value s = (super of package.CPackageQualified<package.IPackageQualified>).string; 
        value ref = package.SubPackageQualified;
        value mref = package.SubPackageQualified.m;
        value objExpr = object extends SubPackageQualified() satisfies package.IPackageQualified {};// TODO extends
        value meta = `package.IPackageQualified`;
        value meta2 = `package.CPackageQualified<package.IPackageQualified>`;
        value decl = `interface package.IPackageQualified`;
        value decl2 = `class package.CPackageQualified`; 
    }
}