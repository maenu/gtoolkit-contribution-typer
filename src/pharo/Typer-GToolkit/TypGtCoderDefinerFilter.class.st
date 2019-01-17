Class {
	#name : #TypGtCoderDefinerFilter,
	#superclass : #GtCoderMethodsFilter,
	#instVars : [
		'name'
	],
	#category : #'Typer-GToolkit-Core'
}

{ #category : #testing }
TypGtCoderDefinerFilter >> includeMethod: aCompiledMethod [
	<typTypeArgument: 1 as: 'CompiledMethod<Integer>'>
	<typTypeResultAs: 'Boolean'>
	^ (aCompiledMethod methodClass hasInstVarNamed: name)
		or: [ aCompiledMethod methodClass instanceSide hasClassVarNamed: name ]
]

{ #category : #accessing }
TypGtCoderDefinerFilter >> initialize [
	<typTypeVariable: 'name' as: 'String<Character>'>
	super initialize
]

{ #category : #accessing }
TypGtCoderDefinerFilter >> name [
	<typTypeResultAs: 'String<Character>'>
	^ name
]

{ #category : #accessing }
TypGtCoderDefinerFilter >> name: anObject [
	<typTypeArgument: 1 as: 'String<Character>'>
	name := anObject
]
