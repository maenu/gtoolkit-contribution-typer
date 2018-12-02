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
				parameters:
					{Symbol typAsType.
					(TypParametricType new
						type: OrderedCollection typAsType asNonParametricType;
						parameters: {TypType typAsType};
						yourself)};
				yourself)};
		yourself
]

{ #category : #accessing }
TypMethodResolver >> argumentTypeAt: anInteger for: anAssociation resolvedBy: anotherAssociation [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeArgument: 2 as: 'Association<TypType,Association<Symbol,OrderedCollection<TypType>>>'>
	<typTypeArgument: 3 as: 'Association<TypType,Association<Symbol,OrderedCollection<TypType>>>'>
	<typTypeResultAs: 'TypType'>
	^ argumentTypes
		cull: self
		cull: anInteger
		cull: anAssociation
		cull: anotherAssociation
]

{ #category : #accessing }
TypMethodResolver >> argumentTypes [
	<typTypeResultAs: 'BlockClosure<TypResolver<Association<Symbol,OrderedCollection<TypType>>>,Integer,Association<TypType,Association<Symbol,OrderedCollection<TypType>>>>'>
	^ argumentTypes
]

{ #category : #accessing }
TypMethodResolver >> argumentTypes: anObject [
	<typTypeArgument: 1 as: 'BlockClosure<TypResolver<Association<Symbol,OrderedCollection<TypType>>>,Integer,Association<TypType,Association<Symbol,OrderedCollection<TypType>>>>'>
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
	^ anAssociation key asNonParametricType asNonNullableType = receiverType asNonParametricType asNonNullableType and: [ anAssociation value key = selector ]
]

{ #category : #accessing }
TypMethodResolver >> resultType [
	<typTypeResultAs: 'BlockClosure<TypResolver<Association<Symbol,OrderedCollection<TypType>>>,Association<TypType,Association<Symbol,OrderedCollection<TypType>>>>'>
	^ resultType
]

{ #category : #accessing }
TypMethodResolver >> resultType: anObject [
	<typTypeArgument: 1 as: 'BlockClosure<TypResolver<Association<Symbol,OrderedCollection<TypType>>>,Association<TypType,Association<Symbol,OrderedCollection<TypType>>>>'>
	resultType := anObject
]

{ #category : #accessing }
TypMethodResolver >> resultTypeFor: anAssociation resolvedBy: anotherAssociation [
	<typTypeArgument: 1 as: 'Association<TypType,Association<Symbol,OrderedCollection<TypType>>>'>
	<typTypeArgument: 2 as: 'Association<TypType,Association<Symbol,OrderedCollection<TypType>>>'>
	<typTypeResultAs: 'TypType'>
	^ resultType cull: self cull: anAssociation cull: anotherAssociation
]
