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
	(TypInfNodeStack canPush: method ast) ifFalse: [ ^ false ].
	^ true
]

{ #category : #'as yet unclassified' }
TypInfMethodResolver >> invalidate: aMethodLookup onClassChange: aClassAnnouncement [

	^ aClassAnnouncement typInfInvalidatesMethod: aMethodLookup
]

{ #category : #'as yet unclassified' }
TypInfMethodResolver >> invalidate: aMethodLookup onMethodChange: aMethodAnnouncement [

	^ aMethodAnnouncement typInfInvalidatesMethod: aMethodLookup
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
	TypInfIndex instance cache
		typAt: aLookup typInfAsContextPath
		ifPresent: [ :c | 
			(TypInfNodeStack actives size + 1 < c nodeStackDepth
				and: [ TypInfNodeStack canPush: aLookup compiledMethod ast ])
				ifTrue: [ aLookup result: (self result: aLookup) ] ].
	^ super update: aLookup
]
