Class {
	#name : #TypGtCoderDefinerFilter,
	#superclass : #GtCoderMethodsFilter,
	#traits : 'TTypGtCoderMethodsFilter',
	#classTraits : 'TTypGtCoderMethodsFilter classTrait',
	#instVars : [
		'name'
	],
	#category : #'Typer-GToolkit-Filter'
}

{ #category : #testing }
TypGtCoderDefinerFilter >> includeMethod: aCompiledMethod [
	^ (aCompiledMethod methodClass hasInstVarNamed: name) or: [ aCompiledMethod methodClass hasClassVarNamed: name ]
]

{ #category : #accessing }
TypGtCoderDefinerFilter >> name [
	^ name
]

{ #category : #accessing }
TypGtCoderDefinerFilter >> name: anObject [
	name := anObject
]
