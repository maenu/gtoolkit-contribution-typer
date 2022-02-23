Class {
	#name : #TypInfFlowState,
	#superclass : #Object,
	#instVars : [
		'index',
		'selfType',
		'superType'
	],
	#category : #'Typer-Inference'
}

{ #category : #'as yet unclassified' }
TypInfFlowState class >> nodes: aCollection self: aType super: anotherType [

	^ self new
		  initializeNodes: aCollection self: aType super: anotherType;
		  yourself
]

{ #category : #initialization }
TypInfFlowState >> initializeNodes: aCollection self: aType super: anotherType [

	selfType := aType.
	superType := anotherType.
	index := IdentityDictionary new.
	aCollection do: [ :e | e initialize: self ]
]

{ #category : #'as yet unclassified' }
TypInfFlowState >> self [

	^ selfType
]

{ #category : #'as yet unclassified' }
TypInfFlowState >> super [

	^ superType
]
