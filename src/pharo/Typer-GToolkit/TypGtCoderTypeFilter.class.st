Class {
	#name : #TypGtCoderTypeFilter,
	#superclass : #GtCoderMethodsFilter,
	#traits : 'TTypGtCoderMethodsFilter',
	#classTraits : 'TTypGtCoderMethodsFilter classTrait',
	#instVars : [
		'type',
		'clazz'
	],
	#category : #'Typer-GToolkit-Filter'
}

{ #category : #testing }
TypGtCoderTypeFilter >> includeMethod: aCompiledMethod [
	<typTypeArgument: 1 as: 'CompiledMethod<Integer>'>
	<typTypeResultAs: 'Boolean'>
	clazz ifNil: [ ^ true ].
	^ aCompiledMethod methodClass == clazz or: [ clazz inheritsFrom: aCompiledMethod methodClass ]
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
	clazz := type hasClass
		ifTrue: [ type asClass ]
		ifFalse: [ nil ]
]
