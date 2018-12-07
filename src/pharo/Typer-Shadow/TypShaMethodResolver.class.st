Class {
	#name : #TypShaMethodResolver,
	#superclass : #TypShaResolver,
	#category : #'Typer-Shadow-Core'
}

{ #category : #accessing }
TypShaMethodResolver >> resolversFor: aLookup [
	| name |
	name := (aLookup selector isBinary
		ifTrue: [ '~' , aLookup selector ]
		ifFalse: [ '_' , aLookup selector ]) asSymbol.
	^ {(shadow perform: name asSymbol withEnoughArguments: {})}
]

{ #category : #accessing }
TypShaMethodResolver >> resolves: aLookup [
	| name |
	name := (aLookup selector isBinary
		ifTrue: [ '~' , aLookup selector ]
		ifFalse: [ '_' , aLookup selector ]) asSymbol.
	^ aLookup receiverType hasClass and: [ aLookup receiverType asClass == shadow shadowedClass and: [ shadow class includesSelector: name ] ]
]
