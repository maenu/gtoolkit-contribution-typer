Class {
	#name : #TypBlockClosureType,
	#superclass : #TypParametricType,
	#instVars : [
		'internalResultType'
	],
	#category : #'Typer-Core'
}

{ #category : #comparing }
TypBlockClosureType >> = anObject [
	^ self == anObject
		or: [ self class = anObject class
				and: [ nullable = anObject nullable
						and: [ type = anObject type and: [ parameters = anObject parameters and: [ internalResultType = anObject internalResultType ] ] ] ] ]
]

{ #category : #comparing }
TypBlockClosureType >> hash [
	^ super hash bitXor: internalResultType hash
]

{ #category : #initialization }
TypBlockClosureType >> initialize [
	<typTypeVariable: 'internalReturnType' as: 'TypType'>
	super initialize
]

{ #category : #accessing }
TypBlockClosureType >> internalResultType [
	^ internalResultType
]

{ #category : #accessing }
TypBlockClosureType >> internalResultType: anObject [
	internalResultType := anObject
]

{ #category : #testing }
TypBlockClosureType >> isBlockClosure [
	<typTypeResultAs: 'Boolean'>
	^ true
]
