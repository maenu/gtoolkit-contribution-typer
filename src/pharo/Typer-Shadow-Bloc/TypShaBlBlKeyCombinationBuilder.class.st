Class {
	#name : #TypShaBlBlKeyCombinationBuilder,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Bloc'
}

{ #category : #'as yet unclassified' }
TypShaBlBlKeyCombinationBuilder class >> shadowedClass [
	^ BlKeyCombinationBuilder class
]

{ #category : #shadow }
TypShaBlBlKeyCombinationBuilder >> mBuild: aLookup [
	<typShaMethod: 'build'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: BlKeyCombination typAsType
]

{ #category : #shadow }
TypShaBlBlKeyCombinationBuilder >> mKey: aLookup [
	<typShaMethod: 'key:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments: {Key typAsType}
]
