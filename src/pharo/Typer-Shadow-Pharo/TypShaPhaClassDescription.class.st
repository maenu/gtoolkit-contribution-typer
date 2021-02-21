Class {
	#name : #TypShaPhaClassDescription,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaClassDescription class >> shadowedClass [
	^ ClassDescription class
]

{ #category : #shadow }
TypShaPhaClassDescription >> mAddInstVarNamed: aLookup [ 
	<typShaMethod: 'addInstVarNamed:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaPhaClassDescription >> mClassSide: aLookup [ 
	<typShaMethod: 'classSide'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Metaclass typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaClassDescription >> mHasInstVarNamed: aLookup [ 
	<typShaMethod: 'hasInstVarNamed:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaClassDescription >> mInstanceSide: aLookup [ 
	<typShaMethod: 'instanceSide'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Class typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaClassDescription >> mIsClassSide: aLookup [ 
	<typShaMethod: 'isClassSide'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaClassDescription >> mIsTestCase: aLookup [ 
	<typShaMethod: 'isTestCase'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]
