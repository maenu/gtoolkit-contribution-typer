Class {
	#name : #TypGtExamples,
	#superclass : #Object,
	#category : #'Typer-GToolkit-Examples'
}

{ #category : #accessing }
TypGtExamples >> invalidateEverything [
	"nukes typer from memory.
	before calling you should close all tabs to get rid of references in coders etc.
	this takes minutes, but due to memory size checks should not take hours"

	<gtExample>
	| example result beforeFinder afterFinder paths |
	self nilReferences.
	example := TypInfExamples new.
	result := example invalidateEverything.
	(result last beginsWith: 'success') ifTrue: [ ^ result ].
	Smalltalk vm memorySize < (2 * 10 ** 9)
		ifFalse: [ ^ result
				, {'failure, more than 2GB and instantiated typer classes, #pointersTo and ReferenceFinder can help to find out who references it, but it is really slow for this memory size. try closing all tabs and run this again. save, close, start may also help, but saving GB images can be slow'} ].
	
	"sometimes a second GC helps"
	beforeFinder := example spaceTallyResultsItems.
	beforeFinder typInfIsInvalidatedEverything
		ifFalse: [ ^ result
				, {beforeFinder.
						'success, all gone after second garbage collection'} ].
	
	"somehow, calling ReferenceFinder and subsequent GC gets rid of more objects, sometimes"
	beforeFinder results
		detect: [ :e | (e analyzedClassName beginsWith: 'TypGt') not ]
		ifFound: [ :e | paths := ReferenceFinder findAllPathsToInstanceOf: e analyzedClassName asClass ]
		ifNone: [ ^ result
				, {beforeFinder.
						'failure, tried finding a paths to an instantiated typer class, but none found. try closing all tabs and run this again. save, close, start may also help, but saving GB images can be slow'} ].
	afterFinder := example spaceTallyResultsItems.
	afterFinder typInfIsInvalidatedEverything
		ifFalse: [ ^ result
				, {beforeFinder.
						afterFinder.
						'success, all gone after nudging garbage collection'} ].
	paths
		ifNotNil: [ ^ result
				, {beforeFinder.
						afterFinder.
						'failure, nudged garbage collection, break the found paths by nilling a reference in the right place, see next element for paths'.
						paths} ].
	^ result
		, {beforeFinder.
				afterFinder.
				'failure, multiple garbage collections and tricks did not reduce instantiated classes to four gt classes, but could not find a reference to an instance of one of the non-gt ones. is the reference finder not finding all references?'}
]

{ #category : #accessing }
TypGtExamples >> nilReferences [
	"nils references to typer objects held by mostly gt related classes"

	<gtExample>
	"clean up undeclareds
	not sure how to reproduce
	the undeclared class instance variable was pointing to a value"
	SmalltalkImage cleanUp.
	Undeclared associations
		select: [ :a | a value class package name beginsWith: 'Typer' ]
		thenDo: [ :a | Undeclared removeKey: a key ].
		
	"nil various references"
	GtPlaygroundEvaluatedCodeButtonAttribute
		allSubInstancesDo: [ :e | e result: nil ].
	GtInspectorTool allInstances
		select: [ :e | e object class package name beginsWith: 'Typer' ]
		thenDo: [ :e | e object: nil ].
	GtSourceCoderEvaluationResultWithValue allSubInstancesDo: [ :e | e value: nil ].
	GtCoderObjectSpawnRequest allSubInstancesDo: [ :e | e object: nil ].
	GtPharoSourceCoderViewModel allSubInstancesDo: [ :e | e selfObject: nil ].
	LeSharedSnippetContext allSubInstancesDo: [ :e | e selfObject: nil ].
	GtLocalVariablesBindings allInstancesDo: #initialize.

	"forces removal of typer coder extensions, given the addon is disabled"
	GtTextualCoderViewModel allSubInstancesDo: #requestUpdateAddOns.
	
	"some tasks seem to end up in ever-pending state"
	((GtWorld someInstance taskQueue instVarNamed: #tasks) value
		instVarNamed: #pendingTasks) removeAllTasks.
		
	"probably not needed anymore
	was necessary when screwing up with anonymous classes"
	AsyncRejectedPromiseState allInstances
		select: [ :e | 
			e error asString
				beginsWith: 'Instance of a subclass of ProtoObject did not understand ' ]
		thenDo: [ :e | e error: nil ].
		
	"seems like they are never removed, or not always at least"
	BlOverlayListener
		allInstancesDo: [ :e | e overlayElement removeEventHandler: e ].
	BlHandlerAnnouncerRegistry
		allInstancesDo: [ :e | e removeAllSuchThat: [ :f | f isKindOf: BlOverlayListener ] ].
		
	^ self
]
