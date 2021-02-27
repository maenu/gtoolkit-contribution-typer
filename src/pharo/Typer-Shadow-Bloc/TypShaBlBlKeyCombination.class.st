Class {
	#name : #TypShaBlBlKeyCombination,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Bloc'
}

{ #category : #shadow }
TypShaBlBlKeyCombination class >> mBuilder: aLookup [
	<typShaMethod: 'builder'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: BlKeyCombinationBuilder typAsType
]

{ #category : #'as yet unclassified' }
TypShaBlBlKeyCombination class >> shadowedClass [
	^ BlKeyCombination class
]
