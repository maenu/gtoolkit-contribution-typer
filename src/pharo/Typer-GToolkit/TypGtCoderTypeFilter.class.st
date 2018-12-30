Class {
	#name : #TypGtCoderTypeFilter,
	#superclass : #GtCoderMethodsFilter,
	#traits : 'TTypGtCoderMethodsFilter',
	#classTraits : 'TTypGtCoderMethodsFilter classTrait',
	#instVars : [
		'type',
		'clazzes'
	],
	#category : #'Typer-GToolkit-Filter'
}

{ #category : #testing }
TypGtCoderTypeFilter >> includeMethod: aCompiledMethod [
	<typTypeArgument: 1 as: 'CompiledMethod<Integer>'>
	<typTypeResultAs: 'Boolean'>
	clazzes ifEmpty: [ ^ true ].
	^ clazzes includes: aCompiledMethod methodClass
]

{ #category : #initialization }
TypGtCoderTypeFilter >> initialize [
	<typTypeVariable: 'type' as: 'TypType'>
	super initialize
]

{ #category : #accessing }
TypGtCoderTypeFilter >> type [
	<typTypeResultAs: 'TypType'>
	^ type
]

{ #category : #accessing }
TypGtCoderTypeFilter >> type: anObject [
	<typTypeArgument: 1 as: 'TypType'>
	type := anObject.
	clazzes := (((type isUnion
		ifTrue: [ (type "typCastAs TypUnionType") types ]
		ifFalse: [ {type} ]) select: #representsClass) flatCollect: [ :e | e asClass withAllSuperclasses ]) asSet
]
