Class {
	#name : #TypShaPhaRPackage,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRPackage class >> shadowedClass [
	^ RPackage class
]

{ #category : #shadow }
TypShaPhaRPackage >> mDefinedClasses: aLookup [ 
	<typShaMethod: 'definedClasses'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType:
				[ :a :s :r | Collection typAsType copyWithParameters: {Class typAsType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaRPackage >> mMethods: aLookup [ 
	<typShaMethod: 'methods'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType:
				[ :a :s :r | Collection typAsType copyWithParameters: {CompiledMethod typAsType} ];
		yourself
]
