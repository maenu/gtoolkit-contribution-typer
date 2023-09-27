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
	^ aMethod typInfRun: 2 minutes
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

{ #category : #accessing }
TypInfExamples >> invalidateEverything [
	<gtExample>
	| before after |
	before := self spaceTallyResultsItems.
	before typInfIsInvalidatedEverything
		ifTrue: [ ^ {before.
				'success, one garbage collection did it'} ].
	TypType invalidateEverything.
	after := self spaceTallyResultsItems.
	after typInfIsInvalidatedEverything
		ifTrue: [ ^ {before.
				after.
				'success, one garbage collection did it'} ].
	^ {before.
		after.
		'failure, there are still too many instantiated typer classes, try TypGtExamples>>#invalidateEverything'}
]

{ #category : #requirements }
TypInfExamples >> message [

	<gtExample>
	^ self infer: TypInfInferred >> #message
]

{ #category : #accessing }
TypInfExamples >> parseAllAsts [
	<gtExample>
	| before asts after |
	ASTCache reset.
	before := self spaceTallyResultsItems.
	asts := CompiledMethod allInstances
			collect: [ :e | [ e ast ] on: Error do: #yourself ].
	after := self spaceTallyResultsItems.
	^ {before.
		asts.
		after}
]

{ #category : #accessing }
TypInfExamples >> plus [
	<gtExample>
	^ self cleanContextRun: SmallInteger >> #+
]

{ #category : #accessing }
TypInfExamples >> runAllMethods [
	<gtExample>
	^ CompiledMethod allInstances collect: [ :m | m typInfRun: 5 seconds ]
]

{ #category : #accessing }
TypInfExamples >> runAndMonitorAllMethods [
	<gtExample>
	^ CompiledMethod allInstances collect: [ :m | m typInfRun: 5 seconds ]
]

{ #category : #accessing }
TypInfExamples >> runAndMonitorRandomMethod [
	<gtExample>
	^ self someRandomMethods anyOne typInfRunAndMonitor: 3 seconds
]

{ #category : #accessing }
TypInfExamples >> runAndMonitorSomeRandomMethods [
	<gtExample>
	^ self someRandomMethods collect: [ :m | m typInfRunAndMonitor: 30 seconds ]
]

{ #category : #accessing }
TypInfExamples >> runRandomMethod [
	<gtExample>
	^ self someRandomMethods anyOne typInfRun: 30 seconds
]

{ #category : #accessing }
TypInfExamples >> runSomeRandomMethods [
	<gtExample>
	^ self someRandomMethods collect: [ :m | m typInfRun: 30 seconds ]
]

{ #category : #accessing }
TypInfExamples >> someRandomMethods [
	| all methods |
	all := CompiledMethod allInstances.
	methods := IdentitySet new.
	[ methods size < 3 ] whileTrue: [ methods add: all atRandom ].
	^ methods
]

{ #category : #accessing }
TypInfExamples >> spaceTallyResultsItems [
	<gtExample>
	"system-wide seems to be faster than querying ~100 classes"
	^ (SpaceTally new systemWideSpaceTally 
		select: [ :e | e analyzedClassName beginsWith: 'Typ' ])
		sorted: [ :a :b | a instanceCount > b instanceCount ]
]

{ #category : #requirements }
TypInfExamples >> translated [

	<gtExample>
	^ self infer: TypInfInferred >> #translated
]
