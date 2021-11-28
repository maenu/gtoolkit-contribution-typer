Class {
	#name : #TypGtCoderDefinerFilter,
	#superclass : #GtSearchMethodsFilter,
	#instVars : [
		'name'
	],
	#category : 'Typer-GToolkit'
}

{ #category : #testing }
TypGtCoderDefinerFilter >> includesMethod: aCompiledMethod [

	<typPraResult: 'Boolean'>
	<typPraArguments: 'CompiledMethod()->?'>
	^ (aCompiledMethod methodClass hasInstVarNamed: name) or: [ 
		  aCompiledMethod methodClass instanceSide hasClassVarNamed: name ]
]

{ #category : #accessing }
TypGtCoderDefinerFilter >> initialize [
	<typPraVariable: 'name' as: 'String'>
	super initialize
]

{ #category : #accessing }
TypGtCoderDefinerFilter >> name [
	<typPraResult: 'String'>
	^ name
]

{ #category : #accessing }
TypGtCoderDefinerFilter >> name: anObject [
	<typPraArguments: 'String'>
	name := anObject
]
