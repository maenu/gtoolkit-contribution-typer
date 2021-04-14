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
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType copyWithParameters: {Class typAsType})
]

{ #category : #shadow }
TypShaPhaRPackage >> mMethods: aLookup [
	<typShaMethod: 'methods'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (Collection typAsType copyWithParameters: {CompiledMethod typAsType})
]
