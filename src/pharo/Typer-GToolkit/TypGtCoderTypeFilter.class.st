Class {
	#name : #TypGtCoderTypeFilter,
	#superclass : #GtCoderMethodsFilter,
	#traits : 'TTypGtCoderMethodsFilter',
	#classTraits : 'TTypGtCoderMethodsFilter classTrait',
	#instVars : [
		'type'
	],
	#category : #'Typer-GToolkit-Filter'
}

{ #category : #testing }
TypGtCoderTypeFilter >> includeMethod: aCompiledMethod [
	| clazz |
	type hasClass
		ifFalse: [ ^ true ].
	clazz := type asClass.
	^ aCompiledMethod methodClass == clazz or: [ clazz inheritsFrom: aCompiledMethod methodClass ]
]

{ #category : #accessing }
TypGtCoderTypeFilter >> type [
	^ type
]

{ #category : #accessing }
TypGtCoderTypeFilter >> type: anObject [
	type := anObject
]
