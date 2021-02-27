Class {
	#name : #TypShaPhaRBLiteralValueNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #shadow }
TypShaPhaRBLiteralValueNode class >> mValue: aLookup [
	<typShaMethod: 'value:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription instanceSide typAsType
		arguments:
			{{Number typAsType.
			String typAsType} typAsType}
]

{ #category : #'as yet unclassified' }
TypShaPhaRBLiteralValueNode class >> shadowedClass [
	^ RBLiteralValueNode class
]
