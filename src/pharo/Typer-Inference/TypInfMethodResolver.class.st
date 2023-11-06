Class {
	#name : #TypInfMethodResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Inference-Lookup'
}

{ #category : #accessing }
TypInfMethodResolver >> canResolve: aLookup [
	| method |
	aLookup receiver isNamed ifFalse: [ ^ false ].
	aLookup receiver hasClassDescription ifFalse: [ ^ false ].
	(aLookup receiver classDescription includesSelector: aLookup selector)
		ifFalse: [ ^ false ].
	method := aLookup receiver classDescription >> aLookup selector.
	^ TypInfNodeStack canPush: method ast
]

{ #category : #printing }
TypInfMethodResolver >> printOn: aStream [

	aStream nextPutAll: 'inf method'
]

{ #category : #accessing }
TypInfMethodResolver >> result: aLookup root: anotherLookup [
	^ (TypInfIndex instance contextAt: aLookup) root type
]

{ #category : #accessing }
TypInfMethodResolver >> result: aLookup root: anotherLookup update: aType [
	^ self result: aLookup root: anotherLookup
]
