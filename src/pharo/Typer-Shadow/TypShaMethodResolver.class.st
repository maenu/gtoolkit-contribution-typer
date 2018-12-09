Class {
	#name : #TypShaMethodResolver,
	#superclass : #TypShaResolver,
	#category : #'Typer-Shadow-Core'
}

{ #category : #accessing }
TypShaMethodResolver >> resolversFor: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypResolver<TypMethodLookup>>'>
	| name |
	name := (aLookup selector isBinary
		ifTrue: [ '~~~' , aLookup selector ]
		ifFalse: [ '___' , aLookup selector ]) asSymbol.
	^ {(shadow perform: name asSymbol withEnoughArguments: {})}
]

{ #category : #accessing }
TypShaMethodResolver >> resolves: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: 'Boolean'>
	| name |
	name := (aLookup selector isBinary
		ifTrue: [ '~~~' , aLookup selector ]
		ifFalse: [ '___' , aLookup selector ]) asSymbol.
	^ aLookup receiverType hasClass and: [ aLookup receiverType asClass == shadow shadowedClass and: [ shadow class includesSelector: name ] ]
]
