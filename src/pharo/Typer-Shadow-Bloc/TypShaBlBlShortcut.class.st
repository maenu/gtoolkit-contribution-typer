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
	<typMigrated>
	CompiledMethod
		typAsFunctionTypeWithResult: BlShortcut typAsType
		arguments:
			{(BlockClosure
				typAsFunctionTypeWithResult: TypUnknownType new
				arguments: {BlElement typAsType}
				argumentsOptional: true
				signalsAlways: false)}
]

{ #category : #shadow }
TypShaBlBlShortcut >> mCombination: aLookup [
	<typShaMethod: 'combination:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlKeyCombination typAsType}
]
