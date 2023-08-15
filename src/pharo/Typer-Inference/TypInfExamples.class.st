Class {
	#name : #TypInfExamples,
	#superclass : #Object,
	#category : #'Typer-Inference-Examples'
}

{ #category : #requirements }
TypInfExamples >> block [

	<gtExample>
	^ self infer: TypInfInferred >> #block:
]

{ #category : #requirements }
TypInfExamples >> blockUseSameTwice [

	<gtExample>
	^ self infer: TypInfInferred >> #blockUseSameTwice:
]

{ #category : #accessing }
TypInfExamples >> cleanContextRun: aMethod [
	| node selfType |
	node := aMethod ast.
	selfType := node methodClass typAsType.
	^ (TypInfContext
		sender: nil
		state: TypInfState new
		node: node
		self: selfType
		super: selfType superOrNil)
		run;
		yourself
]

{ #category : #requirements }
TypInfExamples >> createWindow [
	<gtExample>
	^ self infer: GlutinMainThreadEventLoop >> #createWindow:
]

{ #category : #requirements }
TypInfExamples >> empty [

	<gtExample>
	^ self inferSync: TypInfInferred >> #empty
]

{ #category : #accessing }
TypInfExamples >> infer: aMethod [

	^ TypTyping new typeMethod: aMethod timeout: 2 minutes
]

{ #category : #accessing }
TypInfExamples >> inferMonitored: aMethod [
	TypInfMethodIndex instance.	"rebuild global indexes"
	^ TypTyping new monitorMemoryMethods: {aMethod} timeout: 1 minute
]

{ #category : #accessing }
TypInfExamples >> inferSync: aMethod [

	^ aMethod ast typInfTypeSelf
]

{ #category : #requirements }
TypInfExamples >> inlined [

	<gtExample>
	^ self infer: TypInfInferred >> #inlined
]

{ #category : #requirements }
TypInfExamples >> message [

	<gtExample>
	^ self infer: TypInfInferred >> #message
]

{ #category : #accessing }
TypInfExamples >> plus [
	<gtExample>
	^ self cleanContextRun: SmallInteger >> #+
]

{ #category : #requirements }
TypInfExamples >> translated [

	<gtExample>
	^ self infer: TypInfInferred >> #translated
]
