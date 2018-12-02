Class {
	#name : #TypMethodResolver,
	#superclass : #TypObjectResolver,
	#instVars : [
		'argumentTypes',
		'resultType'
	],
	#category : #'Typer-Core'
}

{ #category : #'as yet unclassified' }
TypMethodResolver class >> typAsType [
	^ TypParametricType new
		type: super typAsType asNonParametricType;
		parameters:
			{(TypParametricType new
				type: Association typAsType asNonParametricType;
				parameters: {Symbol typAsType};
				yourself).
			(TypParametricType new
				type: OrderedCollection typAsType asNonParametricType;
				parameters: {TypType typAsType};
				yourself)};
		yourself
]

{ #category : #accessing }
TypMethodResolver >> argumentTypeAt: anInteger for: anAssociation resolvedBy: anotherAssociation [
	^ argumentTypes
		cull: self
		cull: anInteger
		cull: anAssociation
		cull: anotherAssociation
]

{ #category : #accessing }
TypMethodResolver >> argumentTypes [
	^ argumentTypes
]

{ #category : #accessing }
TypMethodResolver >> argumentTypes: anObject [
	argumentTypes := anObject
]

{ #category : #initialization }
TypMethodResolver >> initialize [
	<typTypeVariable: 'argumentTypes' as: 'BlockClosure<TypResolver<Association<Symbol,OrderedCollection<TypType>>>,Integer,Association<TypType,Association<Symbol,OrderedCollection<TypType>>>>'>
	<typTypeVariable: 'resultType' as: 'BlockClosure<TypResolver<Association<Symbol,OrderedCollection<TypType>>>,Association<TypType,Association<Symbol,OrderedCollection<TypType>>>>'>
	super initialize
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> resolves: anAssociation [
	^ anAssociation key asNonParametricType = receiverType asNonParametricType and: [ anAssociation value key = selector ]
]

{ #category : #accessing }
TypMethodResolver >> resultType [
	^ resultType
]

{ #category : #accessing }
TypMethodResolver >> resultType: anObject [
	resultType := anObject
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> resultTypeFor: anAssociation resolvedBy: anotherAssociation [
	^ resultType cull: self cull: anAssociation cull: anotherAssociation
]
