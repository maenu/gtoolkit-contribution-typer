Class {
	#name : #TypGtCoderTypeFilter,
	#superclass : #GtSearchMethodsFilter,
	#instVars : [
		'type'
	],
	#category : #'Typer-GToolkit'
}

{ #category : #testing }
TypGtCoderTypeFilter >> includesMethod: aCompiledMethod [
	<typTypeArgument: 1 as: 'CompiledMethod'>
	<typTypeResultAs: 'Boolean'>
	^ (type canUnderstand: aCompiledMethod selector)
		and: [ (type lookupSelector: aCompiledMethod selector)
				includes: aCompiledMethod ]
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
	type := anObject
]
