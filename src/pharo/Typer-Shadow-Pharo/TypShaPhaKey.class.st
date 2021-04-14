Class {
	#name : #TypShaPhaKey,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #shadow }
TypShaPhaKey class >> mH: aLookup [
	<typShaMethod: 'h'>
	^ CompiledMethod typAsFunctionTypeWithResult: BlKeyboardKey typAsType
]

{ #category : #shadow }
TypShaPhaKey class >> mT: aLookup [
	<typShaMethod: 't'>
	^ CompiledMethod typAsFunctionTypeWithResult: BlKeyboardKey typAsType
]

{ #category : #'as yet unclassified' }
TypShaPhaKey class >> shadowedClass [
	^ Key class
]
