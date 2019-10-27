Class {
	#name : #TypGtCoderDefinerFilter,
	#superclass : #GtSearchMethodsFilter,
	#instVars : [
		'name'
	],
	#category : #'Typer-GToolkit'
}

{ #category : #testing }
TypGtCoderDefinerFilter >> includesMethod: aCompiledMethod [
	<typTypeArgument: 1 as: 'CompiledMethod()->Object'>
	<typTypeResultAs: 'Boolean'>
	^ (aCompiledMethod methodClass hasInstVarNamed: name)
		or: [ aCompiledMethod methodClass instanceSide hasClassVarNamed: name ]
]

{ #category : #accessing }
TypGtCoderDefinerFilter >> initialize [
	<typTypeVariable: 'name' as: 'String'>
	super initialize
]

{ #category : #accessing }
TypGtCoderDefinerFilter >> name [
	<typTypeResultAs: 'String'>
	^ name
]

{ #category : #accessing }
TypGtCoderDefinerFilter >> name: anObject [
	<typTypeArgument: 1 as: 'String'>
	name := anObject
]
