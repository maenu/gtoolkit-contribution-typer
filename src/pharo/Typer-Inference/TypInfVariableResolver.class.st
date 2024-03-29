Class {
	#name : #TypInfVariableResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Inference-Lookup'
}

{ #category : #accessing }
TypInfVariableResolver >> canResolve: aLookup [
	aLookup receiver isNamed ifFalse: [ ^ false ].
	aLookup receiver hasClassDescription ifFalse: [ ^ false ].
	(aLookup receiver classDescription hasSlotNamed: aLookup selector)
		ifTrue: [ ^ true ].
	^ aLookup receiver classDescription instanceSide allClassVariables
		anySatisfy: [ :e | e name = aLookup selector ]
]

{ #category : #printing }
TypInfVariableResolver >> printOn: aStream [

	aStream nextPutAll: 'inf variable'
]

{ #category : #accessing }
TypInfVariableResolver >> result: aLookup root: anotherLookup [
	| classDescription |
	classDescription := aLookup receiver classDescription.	"instance variable"
	classDescription
		slotNamed: aLookup selector
		ifFound: [ :e | ^ e typInfAssignedTypeSelf: anotherLookup self super: anotherLookup super ].	"class variable"
	^ classDescription instanceSide allClassVariables
		detect: [ :e | e name = aLookup selector ]
		ifFound: [ :e | 
			^ e value
				ifNil: [ e typInfAssignedTypeSelf: anotherLookup self super: anotherLookup super ]
				ifNotNil: #typInfType ]
		ifNone: [ self
				error: 'neither class nor instance variable, should not have been accepted in the first place' ]
]

{ #category : #accessing }
TypInfVariableResolver >> result: aLookup root: anotherLookup update: aType [
	^ self result: aLookup root: anotherLookup
]
