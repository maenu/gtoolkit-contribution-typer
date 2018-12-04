Class {
	#name : #TypShaMethodResolver,
	#superclass : #TypShaResolver,
	#category : #'Typer-Shadow-Core'
}

{ #category : #accessing }
TypShaMethodResolver >> resolverFor: aLookup [
	^ shadow perform: ('_' , aLookup selector) asSymbol withEnoughArguments: {}
]

{ #category : #accessing }
TypShaMethodResolver >> resolves: aLookup [
	^ aLookup receiverType hasClass and: [ aLookup receiverType asClass == shadow shadowedClass and: [ shadow respondsTo: ('_' , aLookup selector) asSymbol ] ]
]
