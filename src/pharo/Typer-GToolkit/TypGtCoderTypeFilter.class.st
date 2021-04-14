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
	<typPraResult: 'Boolean'>
	<typPraArguments: 'CompiledMethod'>
	^ (type canUnderstand: aCompiledMethod selector)
		and: [ (type lookupSelector: aCompiledMethod selector)
				includes: aCompiledMethod ]
]

{ #category : #initialization }
TypGtCoderTypeFilter >> initialize [
	<typPraVariable: 'type' as: 'TypType'>
	super initialize
]

{ #category : #accessing }
TypGtCoderTypeFilter >> type [
	<typPraResult: 'TypType'>
	^ type
]

{ #category : #accessing }
TypGtCoderTypeFilter >> type: anObject [
	<typPraArguments: 'TypType'>
	type := anObject
]
