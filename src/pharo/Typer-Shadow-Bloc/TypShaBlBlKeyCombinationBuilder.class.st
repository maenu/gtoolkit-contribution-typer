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
	^ CompiledMethod
		typAsFunctionTypeWithResult: BlKeyCombination typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaBlBlKeyCombinationBuilder >> mKey: aLookup [
	<typShaMethod: 'key:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments: {Key typAsType}
		argumentsOptional: false
		signalsAlways: false
]
