Class {
	#name : #TypShaBrBrButton,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Brick'
}

{ #category : #'as yet unclassified' }
TypShaBrBrButton class >> shadowedClass [
	^ BrButton class
]

{ #category : #shadow }
TypShaBrBrButton >> mAction: aLookup [
	<typShaMethod: 'action:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlockClosure typAsType}
]

{ #category : #shadow }
TypShaBrBrButton >> mIcon: aLookup [
	<typShaMethod: 'icon:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlElement typAsType}
]
