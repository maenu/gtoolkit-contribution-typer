Class {
	#name : #TypShaBrBrTextLabelLook,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Brick'
}

{ #category : #'as yet unclassified' }
TypShaBrBrTextLabelLook class >> shadowedClass [
	^ BrTextLabelLook class
]

{ #category : #shadow }
TypShaBrBrTextLabelLook >> mFontSize: aLookup [
	<typShaMethod: 'fontSize:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {Number typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaBrBrTextLabelLook >> mForeground: aLookup [
	<typShaMethod: 'foreground:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments:
			{{Color typAsType.
			BlPaint typAsType} typAsType}
		argumentsOptional: false
		signalsAlways: false
]
