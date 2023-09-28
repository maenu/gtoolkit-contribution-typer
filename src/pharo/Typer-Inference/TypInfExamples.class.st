Class {
	#name : #TypInfExamples,
	#superclass : #Object,
	#category : #'Typer-Inference-Examples'
}

{ #category : #requirements }
TypInfExamples >> block [

	<gtExample>
	^ self updateContextAsync: TypInfInferred >> #block:
]

{ #category : #requirements }
TypInfExamples >> blockUseSameTwice [

	<gtExample>
	^ self updateContextAsync: TypInfInferred >> #blockUseSameTwice:
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
	^ self updateContextAsync: GlutinMainThreadEventLoop >> #createWindow:
]

{ #category : #requirements }
TypInfExamples >> empty [

	<gtExample>
	^ self inferSync: TypInfInferred >> #empty
]

{ #category : #accessing }
TypInfExamples >> inferSync: aMethod [

	^ aMethod ast typInfTypeSelf
]

{ #category : #requirements }
TypInfExamples >> inlined [

	<gtExample>
	^ self updateContextAsync: TypInfInferred >> #inlined
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
	^ self updateContextAsync: TypInfInferred >> #message
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
	^ self updateContextAsync: TypInfInferred >> #translated
]

{ #category : #accessing }
TypInfExamples >> updateAllContextsAsync [
	<gtExample>
	^ CompiledMethod allInstances
		collect: [ :m | 
			^ TypInfIndex instance
				updateContextAsync: m typInfAsLookup
				by: #run
				for: 5 seconds ]
]

{ #category : #accessing }
TypInfExamples >> updateAllContextsAsyncWithTally [
	<gtExample>
	^ CompiledMethod allInstances
		collect: [ :m | 
			^ TypInfIndex instance
				updateContextAsync: m typInfAsLookup
				by: #run
				for: 5 seconds ]
]

{ #category : #accessing }
TypInfExamples >> updateContextAsync: aMethod [
	^ TypInfIndex instance
		updateContextAsync: aMethod typInfAsLookup
		by: #run
		for: 2 minutes
]

{ #category : #accessing }
TypInfExamples >> updateRandomContextAsync [
	<gtExample>
	^ TypInfIndex instance
		updateContextAsync: self someRandomMethods anyOne typInfAsLookup
		by: #run
		for: 30 seconds
]

{ #category : #accessing }
TypInfExamples >> updateRandomContextAsyncWithTally [
	<gtExample>
	^ TypInfIndex instance
		updateContextAsyncWithTally: self someRandomMethods anyOne typInfAsLookup
		by: #run
		for: 3 seconds
]

{ #category : #accessing }
TypInfExamples >> updateSomeRandomContextsAsync [
	<gtExample>
	^ self someRandomMethods
		collect: [ :m | 
			^ TypInfIndex instance
				updateContextAsync: m typInfAsLookup
				by: #run
				for: 30 seconds ]
]

{ #category : #accessing }
TypInfExamples >> updateSomeRandomContextsAsyncWithTally [
	<gtExample>
	^ self someRandomMethods
		collect: [ :m | 
			^ TypInfIndex instance
				updateContextAsyncWithTally: m typInfAsLookup
				by: #run
				for: 30 seconds ]
]
