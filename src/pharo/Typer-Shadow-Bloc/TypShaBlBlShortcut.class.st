Class {
	#name : #TypShaBlBlShortcut,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Bloc'
}

{ #category : #'as yet unclassified' }
TypShaBlBlShortcut class >> shadowedClass [
	^ BlShortcut class
]

{ #category : #shadow }
TypShaBlBlShortcut >> mAction: aLookup [

	<typShaMethod: 'action:'>
	^ CompiledMethod
		  typAsFunctionTypeWithResult: BlShortcut typAsType
		  arguments: { (BlockClosure
				   typAsFunctionTypeWithResult: TypUnknownType instance
				   arguments: { BlElement typAsType }
				   argumentsOptional: true
				   signalsAlways: false) }
]

{ #category : #shadow }
TypShaBlBlShortcut >> mCombination: aLookup [
	<typShaMethod: 'combination:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlKeyCombination typAsType}
]
