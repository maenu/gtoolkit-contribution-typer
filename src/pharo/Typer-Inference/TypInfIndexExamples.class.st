Class {
	#name : #TypInfIndexExamples,
	#superclass : #Object,
	#category : #'Typer-Inference-Examples'
}

{ #category : #accessing }
TypInfIndexExamples >> checkCorrectnessAndCompletenessMethodAdditionChangeRemove [
	<gtExample>
	| correctness completeness |
	correctness := TypInfIndex instance correctness.
	completeness := TypInfIndex instance completeness.
	self assert: correctness isEmpty.
	self assert: completeness isEmpty.
	self class
		removeSelector: #override;
		compile: 'override'.
	200 milliSeconds wait.	"give it some time"
	correctness := TypInfIndex instance correctness.
	completeness := TypInfIndex instance completeness.
	self assert: correctness isEmpty.
	self assert: completeness isEmpty.
	self class compile: 'override ^1'.
	200 milliSeconds wait.	"give it some time"
	correctness := TypInfIndex instance correctness.
	completeness := TypInfIndex instance completeness.
	self assert: correctness isEmpty.
	self assert: completeness isEmpty.
	self class removeSelector: #override.
	200 milliSeconds wait.	"give it some time"
	correctness := TypInfIndex instance correctness.
	completeness := TypInfIndex instance completeness.
	self assert: correctness isEmpty.
	self assert: completeness isEmpty.
	^ correctness -> completeness
]
