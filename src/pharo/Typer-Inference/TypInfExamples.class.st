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

{ #category : #requirements }
TypInfExamples >> blockUseSameTwice2 [

	<gtExample>
	^ self infer: TypInfInferred >> #blockUseSameTwice2:
]

{ #category : #requirements }
TypInfExamples >> blockUseSameTwice3 [

	<gtExample>
	^ self infer: TypInfInferred >> #blockUseSameTwice3:
]

{ #category : #requirements }
TypInfExamples >> blockUseSameTwice4 [

	<gtExample>
	^ self infer: TypInfInferred >> #blockUseSameTwice4:
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
TypInfExamples >> inlinedSync [

	<gtExample>
	^ self inferSync: TypInfInferred >> #inlined
]

{ #category : #requirements }
TypInfExamples >> message [

	<gtExample>
	^ self inferSync: TypInfInferred >> #message
]

{ #category : #requirements }
TypInfExamples >> message2 [

	<gtExample>
	^ self infer: TypInfInferred >> #message2
]

{ #category : #requirements }
TypInfExamples >> message3 [

	<gtExample>
	^ self infer: TypInfInferred >> #message3
]

{ #category : #requirements }
TypInfExamples >> message4 [

	<gtExample>
	^ self infer: TypInfInferred >> #message4
]

{ #category : #requirements }
TypInfExamples >> message5 [

	<gtExample>
	^ self infer: TypInfInferred >> #message5
]

{ #category : #requirements }
TypInfExamples >> message6 [

	<gtExample>
	^ self infer: TypInfInferred >> #message6
]

{ #category : #requirements }
TypInfExamples >> message6Monitored [

	<gtExample>
	^ self inferMonitored: TypInfInferred >> #message6
]

{ #category : #requirements }
TypInfExamples >> message6Sync [

	<gtExample>
	^ self inferSync: TypInfInferred >> #message6
]

{ #category : #requirements }
TypInfExamples >> message7 [

	<gtExample>
	^ self infer: TypInfInferred >> #message7
]

{ #category : #requirements }
TypInfExamples >> message7Sync [

	<gtExample>
	^ self inferSync: TypInfInferred >> #message7
]

{ #category : #requirements }
TypInfExamples >> translated [

	<gtExample>
	^ self infer: TypInfInferred >> #translated
]

{ #category : #requirements }
TypInfExamples >> translated2 [

	<gtExample>
	^ self infer: TypInfInferred >> #translated2
]

{ #category : #requirements }
TypInfExamples >> translated3 [

	<gtExample>
	^ self infer: TypInfInferred >> #translated3
]

{ #category : #requirements }
TypInfExamples >> translated4 [

	<gtExample>
	^ self infer: TypInfInferred >> #translated4
]

{ #category : #requirements }
TypInfExamples >> translated5 [

	<gtExample>
	^ self infer: TypInfInferred >> #translated5
]

{ #category : #requirements }
TypInfExamples >> translated6 [

	<gtExample>
	^ self inferSync: TypInfInferred >> #translated6
]

{ #category : #requirements }
TypInfExamples >> translated7 [

	<gtExample>
	^ self infer: TypInfInferred >> #translated7
]

{ #category : #requirements }
TypInfExamples >> translated8 [

	<gtExample>
	^ self infer: TypInfInferred >> #translated8
]

{ #category : #requirements }
TypInfExamples >> translated9 [

	<gtExample>
	^ self infer: TypInfInferred >> #translated9
]
