Class {
	#name : #TypInfMethodResolver,
	#superclass : #TypResolver,
	#instVars : [
		'contexts'
	],
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfMethodResolver >> canResolve: aLookup [
	^ aLookup receiver isNamed
		and: [ aLookup receiver hasClassDescription
				and:
					[ aLookup receiver classDescription includesSelector: aLookup selector ] ]
]

{ #category : #initialization }
TypInfMethodResolver >> initialize [

	super initialize.
	contexts := Dictionary new
]

{ #category : #accessing }
TypInfMethodResolver >> invalidateOnClass: aClassAnnouncement [
	
	contexts removeAll
]

{ #category : #accessing }
TypInfMethodResolver >> invalidateOnMethod: aMethodAnnouncement [

	contexts removeAll
]

{ #category : #accessing }
TypInfMethodResolver >> resolve: aLookup [

	| context |
	self assert: [ self canResolve: aLookup ].
	context := contexts
		           at: aLookup
		           ifAbsentPut: [ 
		           TypInfAstContext self: aLookup root receiver ].
	^ aLookup receiver classDescription >> aLookup selector 
		  typInfTypeIn: context
]
