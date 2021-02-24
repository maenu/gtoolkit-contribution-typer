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
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaBlBlShortcut >> mCombination: aLookup [
	<typShaMethod: 'combination:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments: {BlKeyCombination typAsType}
]
