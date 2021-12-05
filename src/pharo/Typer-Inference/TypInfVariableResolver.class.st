Class {
	#name : #TypInfVariableResolver,
	#superclass : #TypResolver,
	#instVars : [
		'contexts'
	],
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfVariableResolver >> canResolve: aLookup [
	^ aLookup receiver isNamed
		and: [ aLookup receiver hasClassDescription
				and: [ (aLookup receiver classDescription hasSlotNamed: aLookup selector)
						or: [ aLookup receiver classDescription instanceSide allClassVariables
								anySatisfy: [ :e | e name = aLookup selector ] ] ] ]
]

{ #category : #initialization }
TypInfVariableResolver >> initialize [

	super initialize.
	contexts := Dictionary new
]

{ #category : #accessing }
TypInfVariableResolver >> invalidateOnClass: aClassAnnouncement [

	contexts removeAll
]

{ #category : #accessing }
TypInfVariableResolver >> invalidateOnMethod: aMethodAnnouncement [

	contexts removeAll
]

{ #category : #accessing }
TypInfVariableResolver >> resolve: aLookup [

	| context |
	self assert: [ self canResolve: aLookup ].
	context := contexts
		           at: aLookup receiver -> aLookup selector
		           ifAbsentPut: [ TypInfAstContext self: aLookup receiver ].
	(aLookup receiver classDescription hasSlotNamed: aLookup selector) 
		ifTrue: [ 
			^ ((aLookup receiver classDescription slotNamed: aLookup selector)
				   assignmentNodes collect: [ :e | e typInfTypeIn: context ])
				  typAsType ].
	self flag: '...or we just take the type of the value?'.
	^ ((aLookup receiver classDescription instanceSide allClassVariables 
		    detect: [ :e | e name = aLookup selector ]) assignmentNodes 
		   collect: [ :e | e typInfTypeIn: context ]) typAsType
]
