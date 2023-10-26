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
TypInfMethodResolver >> result: aLookup [
	^ (TypInfIndex instance contextAt: aLookup) root type
]

{ #category : #accessing }
TypInfMethodResolver >> update: aLookup [
	super update: aLookup.
	TypInfIndex instance cache
		typAt: aLookup typInfAsContextPath
		ifPresent: [ :c | 
			(TypInfNodeStack actives size + 1 < c nodeStackDepth
				and: [ TypInfNodeStack canPush: aLookup compiledMethod ast ])
				ifTrue: [ aLookup updateTo: (self result: aLookup) by: self ] ]
]
