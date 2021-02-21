Class {
	#name : #TypShaPhaOCLiteralVariable,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaOCLiteralVariable class >> shadowedClass [
	^ OCLiteralVariable class
]

{ #category : #shadow }
TypShaPhaOCLiteralVariable >> mAssoc: aLookup [ 
	<typShaMethod: 'assoc'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			Association typAsType
				copyWithParameters:
					{String typAsType.
					TypUnknownType new} ];
		yourself
]

{ #category : #shadow }
TypShaPhaOCLiteralVariable >> mIsClassVariable: aLookup [ 
	<typShaMethod: 'isClassVariable'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaOCLiteralVariable >> mIsFromSharedPool: aLookup [ 
	<typShaMethod: 'isFromSharedPool'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaOCLiteralVariable >> mIsGlobalClassNameBinding: aLookup [ 
	<typShaMethod: 'isGlobalClassNameBinding'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaOCLiteralVariable >> mIsGlobalVariable: aLookup [ 
	<typShaMethod: 'isGlobalVariable'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaOCLiteralVariable >> mScope: aLookup [ 
	<typShaMethod: 'scope'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | OCAbstractScope typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaOCLiteralVariable >> mValue: aLookup [ 
	<typShaMethod: 'value'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Object typAsType ];
		yourself
]
