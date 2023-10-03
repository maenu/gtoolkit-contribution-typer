Class {
	#name : #TypGtCoderTypeFilter,
	#superclass : #GtSearchMethodsFilter,
	#instVars : [
		'type'
	],
	#category : #'Typer-GToolkit-Core'
}

{ #category : #testing }
TypGtCoderTypeFilter >> includesMethod: aCompiledMethod [
	<typPraResult: 'Boolean'>
	<typPraArguments: 'CompiledMethod()->?'>
	^ type <= aCompiledMethod methodClass typAsType
		or: [ type > aCompiledMethod methodClass typAsType ]
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
