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
	| extensions |
	GtPlaygroundEvaluatedCodeButtonAttribute
		allSubInstancesDo: [ :e | e result: nil ].
	GtInspector allInstancesDo: [ :e | e object: nil ].
	GtInspectorTool allInstancesDo: [ :e | e object: nil ].
	GtSourceCoderEvaluationResultWithValue allSubInstancesDo: [ :e | e value: nil ].
	GtCoderObjectSpawnRequest allSubInstancesDo: [ :e | e object: nil ].
	GtPharoSourceCoderViewModel allSubInstancesDo: [ :e | e selfObject: nil ].
	LeSharedSnippetContext allSubInstancesDo: [ :e | e selfObject: nil ].
	GtLocalVariablesBindings allInstancesDo: #initialize.
	GtExampleWithResult allInstancesDo: [ :e | e result: nil ].
	GtPharoSourceCoder
		allSubInstancesDo: [ :e | 
			e attributes
				at: #typGtSubscription ifPresent: [ :s | s announcer unsubscribe: self ];
				at: #typGtContextPromise ifPresent: #cancelHard;
				removeKey: #typGtContextEnabled ifAbsent: [  "noop" ];
				removeKey: #typGtSubscription ifAbsent: [  "noop" ];
				removeKey: #typGtContextEnabled ifAbsent: [  "noop" ];
				removeKey: #typGtContext ifAbsent: [  "noop" ];
				removeKey: #typGtContextPromiseSourceCode ifAbsent: [  "noop" ];
				removeKey: #typGtContextPromise ifAbsent: [  "noop" ] ].
	GtPharoMethodContextCoder allInstances
		select: [ :e | 
			e context isNotNil
				and: [ e compiledMethod methodClass package name beginsWith: 'Typer' ] ]
		thenDo: [ :e | e instVarNamed: #context put: nil ].
	BlShortcutHandlerWithShortcuts
		allInstancesDo: [ :s | 
			s shortcuts copy
				select: [ :e | e name = 'Take screenshot' ]
				thenDo: [ :e | s removeShortcut: e ] ].
	BlEventHandler allInstancesDo: [ :e | e eventClass = GtTakePicture ifTrue: [ e action: [  ] ] ].
	GtDebuggerPharoStackModel
		allInstancesDo: [ :e | (e instVarNamed: #coderViewModelCache) removeAll ].
	BlMouseProcessor allInstancesDo: #onSpaceClosed.
	
	"forces removal of typer coder extensions"
	extensions := (#gtAstCoderAddOns: gtPragmas & 'Typer' gtPackageMatches)
			contents
			collect: [ :m | 
				{m.
					m methodClass.
					m sourceCode.
					m category} ].
	extensions do: [ :a | a first removeFromSystem ].
	GtTextualCoderViewModel allSubInstancesDo: #requestUpdateAddOns.
	1 second wait.
	extensions do: [ :a | a second compile: a third classified: a fourth ].
	
	"some tasks seem to end up in ever-pending state"
	((GtWorld someInstance taskQueue instVarNamed: #tasks) value
		instVarNamed: #pendingTasks) removeAllTasks.
	AsyncFuturePromise allInstances select: [ :t | t isPending and: [ t state isPendingIndefinitely ] ] thenDo: #cancelHard.
	AsyncFuturePromise allInstances select: #isRejected thenDo: [ :e | e state instVarNamed: #error put: nil ].
	BlEventsStream allInstances
		reject: [ :e | (e instVarNamed: #eventTarget) ifNil: false ifNotNil: #isAttachedToSceneGraph ]
		thenDo: [ :e | (e instVarNamed: #events) value removeAll. e instVarNamed: #eventTarget put: nil ].
	
	"probably not needed anymore, was necessary when screwing up with anonymous classes"
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
