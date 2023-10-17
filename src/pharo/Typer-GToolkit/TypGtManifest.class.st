Class {
	#name : #TypGtManifest,
	#superclass : #PackageManifest,
	#traits : 'TypTManifest',
	#classTraits : 'TypTManifest classTrait',
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtManifest class >> groupedExtensionMethods [
	^ (self package extensionMethods
		groupedBy: [ :m | 
			{#typGtPra.
				#typGtSha.
				#typGtChe.
				#typGtCov} detect: [ :s | m selector beginsWith: s ] ifNone: [ #typGt ] ])
		collect: [ :c | 
			c
				sorted: [ :a :b | 
					a methodClass name = b methodClass name
						ifTrue: [ a selector < b selector ]
						ifFalse: [ a methodClass name < b methodClass name ] ] ]
]

{ #category : #accessing }
TypGtManifest class >> nil [
	"nils references to typer objects held by mostly gt related classes"

	<gtExample>
	<noTest>
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
	GtExampleWithResult allInstancesDo: [ :e | e result: nil ].
	GtPharoSourceCoder
		allSubInstancesDo: [ :e | e attributes
				removeKey: #typGtContext ifAbsent: [  "noop" ];
				removeKey: #typGtContextPromise ifAbsent: [  "noop" ];
				removeKey: #typGtLookup ifAbsent: [  "noop" ] ].

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
