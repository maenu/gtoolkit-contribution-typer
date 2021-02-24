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
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments: {Number typAsType}
]

{ #category : #shadow }
TypShaBrBrTextLabelLook >> mForeground: aLookup [
	<typShaMethod: 'foreground:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments:
			{{Color typAsType.
			BlPaint typAsType} typAsType}
]
