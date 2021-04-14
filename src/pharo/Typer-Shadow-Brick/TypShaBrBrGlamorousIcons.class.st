Class {
	#name : #TypShaBrBrGlamorousIcons,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Brick'
}

{ #category : #shadow }
TypShaBrBrGlamorousIcons class >> mBrowse: aLookup [
	<typShaMethod: 'browse'>
	^ CompiledMethod typAsFunctionTypeWithResult: Form typAsType
]

{ #category : #shadow }
TypShaBrBrGlamorousIcons class >> mInspect: aLookup [
	<typShaMethod: 'inspect'>
	^ CompiledMethod typAsFunctionTypeWithResult: Form typAsType
]

{ #category : #'as yet unclassified' }
TypShaBrBrGlamorousIcons class >> shadowedClass [
	^ BrGlamorousIcons class
]
