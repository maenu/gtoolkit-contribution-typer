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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {Number typAsType}
]

{ #category : #shadow }
TypShaBrBrTextLabelLook >> mForeground: aLookup [
	<typShaMethod: 'foreground:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments:
			{{Color typAsType.
			BlPaint typAsType} typAsType}
]
