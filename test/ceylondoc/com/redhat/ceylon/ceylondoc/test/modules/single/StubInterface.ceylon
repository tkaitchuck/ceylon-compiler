/*
 * Copyright Red Hat Inc. and/or its affiliates and other contributors
 * as indicated by the authors tag. All rights reserved.
 *
 * This copyrighted material is made available to anyone wishing to use,
 * modify, copy, or redistribute it subject to the terms and conditions
 * of the GNU General Public License version 2.
 * 
 * This particular file is subject to the "Classpath" exception as provided in the 
 * LICENSE file that accompanied this code.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT A
 * WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
 * PARTICULAR PURPOSE.  See the GNU General Public License for more details.
 * You should have received a copy of the GNU General Public License,
 * along with this distribution; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston,
 * MA  02110-1301, USA.
 */
"This is `StubInterface`"
tagged("stubTag1a", "stubTag1b", "stubTagWithVeryLongName ... !!!")
shared interface StubInterface of StubInterfaceA | StubClass | stubInterfaceB {

  "Description of StubInterface.formalMethodFromStubInterface"
  see(`interface`)
  shared formal void formalMethodFromStubInterface();
  
  "Description of StubInterface.defaultDeprecatedMethodFromStubInterface"
  deprecated("Deprecated in StubInterface.defaultDeprecatedMethodFromStubInterface")
  shared default void defaultDeprecatedMethodFromStubInterface() {}
  
  "bug #927 in loading inherited members"
  shared actual default String string { return ""; }
    
}

shared abstract class Foo() of bar | gee {}
shared object bar extends Foo(){}
shared object gee extends Foo(){}

shared interface StubInterfaceA satisfies StubInterface {}

shared object stubInterfaceB satisfies StubInterface {
    shared actual void formalMethodFromStubInterface() {}
}
